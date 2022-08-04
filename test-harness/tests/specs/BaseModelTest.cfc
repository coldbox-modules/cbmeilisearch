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
		addTestDocuments();
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

		var task = getWirebox().getInstance( "Tasks@cbmeilisearch" );
		task.pollTaskCompletion( result.taskUid, 500 );

		// basic settings for index
		var settingsUpdate = getWirebox().getInstance( "Settings@cbmeilisearch").updateSettings( "products", {
			"filterableAttributes" : [ "category", "manufactureYear" ],
			"sortableAttributes" : [ "category", "manufactureYear" ]
		} );
		task.pollTaskCompletion( settingsUpdate.taskUid, 500 );

	}


    function addTestDocuments(){
        var documents = [
            {
                "id"    : "99",
                "title" : "Bulova Men's Leather Wrist Watch",
                "cost" : "49.99"
            },
            {
                "id"    : "11",
                "title" : "Bulova Men's Stainless Steel Bracelet Watch",
                "cost" : "49.99"
            },
            {
                "id"    : "76",
                "title" : "Timex Men's BST.47 Black Silicone Strap Watch",
                "cost" : "96.99"
            }
        ];
        var result = getWirebox().getInstance( "Documents@cbmeilisearch" ).addOrReplace(
            index  = "products",
            documents  = documents,
            primaryKey = "id"
        );
    }
}
