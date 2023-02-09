component extends="coldbox.system.testing.BaseModelTest" {

	this.loadColdbox   = true;
	this.unLoadColdbox = true;

	param this.MEILISEARCH_VERSION = "unknown";
	getMeilisearchVersion();

	function beforeAll(){
		super.beforeAll();

		// setup the model
		super.setup();

		if ( variables.keyExists( "model" ) ) {
			// init the model object
			model.init();

			getWirebox().autowire( variables.model );
		}

		ensureTestIndexExists();
		addTestDocuments();
	}

	/**
	 * Useful for skipping tests if the current Meilisearch version is less than some minimum.
	 *
	 * @version The version string from Meiilisearch. "v0.28.1"
	 */
	function parseVersion( required string version ){
		return javaCast( "float",
			reReplace(
				reReplace(
					arguments.version,
					"[^0-9.]",
					"",
					"all"
				),
				"([0-9]+).([0-9]+).([0-9]+)",
				"\1\2\3"
			)
		);
	}

	function getMeilisearchVersion(){
		var system = createObject( "java", "java.lang.System" );
		var host = !isNull( system.getProperty('MEILISEARCH_HOST') ) ? system.getProperty('MEILISEARCH_HOST') : "127.0.0.1";
		var port = !isNull( system.getProperty('MEILISEARCH_PORT') ) ? system.getProperty('MEILISEARCH_PORT') : "7700";

		local.result          = "";
		cfhttp( url = "#host#:#port#/version", result = "local.result"){
			cfhttpparam( name = "Authorization", type="header", value = "Bearer #system.getProperty( 'MEILISEARCH_MASTER_KEY' )#" );
		}
		if ( 200 < val( local.result.statuscode ) > 299 ){
			throw( "Meilisearch is not reachable" );
		} else if ( left( local.result.statuscode, 1 ) != 2 ){
			throw(
				message = "Unexpected Meilisearch status code: #local.result.statuscode#",
				detail = "Used API key #system.getProperty( 'MEILISEARCH_MASTER_KEY' )#",
				extendedInfo = serializeJSON( local.result )
			);
		}
		this.MEILISEARCH_VERSION = deserializeJSON( local.result.filecontent ).pkgVersion;
	}

	function ensureTestIndexExists(){
		var indexes  = getWirebox().getInstance( "cbmeilisearch.models.endpoints.Indexes" );
		indexes.deleteIndex( uid = "products" );
		var response = indexes.createIndex( uid = "products", primaryKey = "id" );
		expect( response.isSuccess() ).toBeTrue();
		var result = response.json();

		expect( result )
			.toBeStruct()
			.toHaveKey( "status" )
			.toHaveKey( "type" );
		expect( result.status ).toBe( "enqueued" );
		expect( result.type ).toBe( "indexCreation" );

		var task = getWirebox().getInstance( "Tasks@cbmeilisearch" );
		task.waitForTask( result.taskUid, 500 );

		// basic settings for index
		var settingsUpdate = getWirebox()
			.getInstance( "Settings@cbmeilisearch" )
			.updateSettings(
				"products",
				{
					"filterableAttributes" : [ "category", "manufactureYear" ],
					"sortableAttributes"   : [ "category", "manufactureYear", "title" ],
					"searchableAttributes" : [ "title" ]
				}
			)
			.json();
		task.waitForTask( settingsUpdate.taskUid, 500 );
	}


	function addTestDocuments(){
		var documents = [
			{
				"id"    : "99",
				"title" : "Bulova Men's Leather Wrist Watch",
				"cost"  : "49.99"
			},
			{
				"id"    : "11",
				"title" : "Bulova Men's Stainless Steel Bracelet Watch",
				"cost"  : "49.99"
			},
			{
				"id"    : "76",
				"title" : "Timex Men's BST.47 Black Silicone Strap Watch",
				"cost"  : "96.99"
			}
		];
		var result = getWirebox()
			.getInstance( "Documents@cbmeilisearch" )
			.addDocuments(
				index      = "products",
				documents  = documents,
				primaryKey = "id"
			);
	}

	function run(){
		describe( "BaseModelTest", function() {
			it( "can parse version", function() {
				expect( parseVersion( "v0.30.0" ) ).toBe( "0300" );
				expect( parseVersion( "v0.30.0" ) ).toBe( parseVersion( "v0.30.0" ) );
				expect( parseVersion( "v0.30.1" ) ).toBeGT( parseVersion( "v0.30.0" ) );
				expect( parseVersion( "v0.30.0" ) ).toBeGT( parseVersion( "v0.28.0" ) );
				expect( parseVersion( "v0.30.1" ) ).toBeLT( parseVersion( "v0.30.3" ) );
				debug( parseVersion( "v0.30.0" ) );
				debug( parseVersion( "v0.30.0" ) );
			})
		})
	}

}
