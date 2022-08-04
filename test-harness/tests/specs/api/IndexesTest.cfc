/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.api.Indexes" {

	variables.index = "";

	function run(){
		describe( "Indexes Suite", function(){
			it( "+list", function(){
				var result = model.list();
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "results" );
				expect( result.results ).toBeArray();
			} );
			it( "+list with pagination", function(){
				var result = model.list(
					limit = 1,
					offset = 0
				);
				expect( result.results.len() ).toBe( 1 );
				expect( result ).toBeStruct().toHaveKey( "results" );
				expect( result.results ).toBeArray();
			} );

			it( "+create", function(){
				var result = model.create( "movies", "id" );
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
				var task = getWirebox().getInstance( "cbmeilisearch.models.api.Tasks" );
				task.pollTaskCompletion( result.taskUid, 500 );
			} );

			it( "+get", function(){
				var result = model.get( "movies" );
				// debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+update", function(){
				var result = model.update( "movies", "movieID" );
				// debug( result );

				expect( result )
					.toBeStruct()
					.toHaveKey( "status" )
					.toHaveKey( "type" );
				expect( result.status ).toBe( "enqueued" );
				expect( result.type ).toBe( "indexUpdate" );
			} );

			it( "+delete", function(){
				var result = model.delete( "movies" );
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
