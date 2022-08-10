/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.endpoints.Indexes" {

	variables.index = "";

	function run(){
		describe( "Indexes Suite", function(){
			it( "+getAllIndexes", function(){
				var result = model.getAllIndexes();
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "results" );
				expect( result.results ).toBeArray();
			} );
			it( "+getAllIndexes with pagination", function(){
				var result = model.getAllIndexes( {
					"limit" : 1,
					"offset": 0
				} );
				expect( result.results.len() ).toBe( 1 );
				expect( result ).toBeStruct().toHaveKey( "results" );
				expect( result.results ).toBeArray();
			} );

			it( "+createIndex", function(){
				var result = model.createIndex( "movies", { "primaryKey" : "id" } );
				// debug( result );

				expect( result )
					.toBeStruct()
					.toHaveKey( "status" )
					.toHaveKey( "type" );
				expect( result.status ).toBe( "enqueued" );
				expect( result.type ).toBe( "indexCreation" );

				/**
				 * Pause the rest of the test until the asynchronous index creation has completed.
				 *
				 * See https://docs.meilisearch.com/reference/api/overview.html#asynchronous-operations
				 */
				var task = getWirebox().getInstance( "cbmeilisearch.models.endpoints.Tasks" );
				task.waitForTask( result.taskUid, 500 );
			} );

			it( "+getIndex", function(){
				var result = model.getIndex( "movies" );
				// debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+updateIndex", function(){
				var result = model.updateIndex( "movies", { "primaryKey" : "movieID" } );
				// debug( result );

				expect( result )
					.toBeStruct()
					.toHaveKey( "status" )
					.toHaveKey( "type" );
				expect( result.status ).toBe( "enqueued" );
				expect( result.type ).toBe( "indexUpdate" );
			} );

			it( "+deleteIndex", function(){
				var result = model.deleteIndex( "movies" );
				// debug( result );

				expect( result )
					.toBeStruct()
					.toHaveKey( "status" )
					.toHaveKey( "type" );
				expect( result.status ).toBe( "enqueued" );
				expect( result.type ).toBe( "indexDeletion" );
			} );
		} );
	}

}
