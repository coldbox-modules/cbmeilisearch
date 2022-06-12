/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.api.Indexes"{

	variables.index_uid = "";

	function run(){

		describe( "Indexes Suite", function(){

			it( "+list", function() {
				var result = model.list();
				debug( result );
				expect( result ).toBeArray();
			});

			it( "+create", function() {
				var result = model.create(
					uid : "movies",
					primaryKey : "id"
				);
				debug( result );

				expect( result ).toBeStruct().toHaveKey( "status" ).toHaveKey( "type" );
				expect( result.status ).toBe( "enqueued" );
				expect( result.type ).toBe( "indexCreation" );

				/**
				 * TODO: Pause the rest of the test until the asynchronous index creation has completed.
				 * 
				 * See https://docs.meilisearch.com/reference/api/overview.html#asynchronous-operations
				 */
			});

			it( "+get", function() {
				var result = model.get( "movies" );
				debug( result );
				expect( result ).toBeStruct();
			});

			it( "+update", function() {
				var result = model.update(
					uid : "movies",
					primaryKey : "movieID"
				);
				debug( result );

				expect( result ).toBeStruct().toHaveKey( "status" ).toHaveKey( "type" );
				expect( result.status ).toBe( "enqueued" );
				expect( result.type ).toBe( "indexUpdate" );
			});

			it( "+delete", function() {
				var result = model.delete( "movies" );
				debug( result );

				expect( result ).toBeStruct().toHaveKey( "status" ).toHaveKey( "type" );
				expect( result.status ).toBe( "enqueued" );
				expect( result.type ).toBe( "indexDeletion" );
			});
		});

	}

}
