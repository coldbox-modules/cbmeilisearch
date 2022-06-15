component extends="coldbox.system.testing.BaseModelTest" {

	this.loadColdbox   = true;
	this.unLoadColdbox = false;

	function beforeAll(){
		super.beforeAll();

		// setup the model
		super.setup();

		if ( variables.keyExists( "model" ) ){
			// init the model object
			model.init();

			getWirebox().autowire( variables.model );
		}

		ensureTestIndexExists();
	}

	function afterAll(){
		super.afterAll();
	}

	function ensureTestIndexExists(){
		var indexes = getWirebox().getInstance( "cbmeilisearch.models.api.Indexes" );
		var result = indexes.create(
			uid = "products",
			primaryKey = "id"
		);

		expect( result )
			.toBeStruct()
			.toHaveKey( "status" )
			.toHaveKey( "type" );
		expect( result.status ).toBe( "enqueued" );
		expect( result.type ).toBe( "indexCreation" );

		/**
		 * TODO: Pause the rest of the test until the asynchronous index creation has completed.
		 *
		 * See https://docs.meilisearch.com/reference/api/overview.html#asynchronous-operations
		 */
	}

}
