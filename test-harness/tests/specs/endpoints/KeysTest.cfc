/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.endpoints.Keys" {

	variables.testKey = "no_worky";

	function run(){
		describe( "Keys Suite", function(){
			it( "+getAllKeys", function(){
				var result = model.getAllKeys();

				// debug( result );
				expect( result ).toBeStruct();
			} );
			it( "+getAllKeys with pagination", function(){
				var result = model.getAllKeys( offset = 1, limit = 1 );

				// debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+createKey", function(){
				var result = model.createKey( {
					"name"       : "cbMeilisearch Test Key",
					"description": "Add documents: Movies API key",
					"actions"    : [ "documents.add" ],
					"indexes"    : [ "products" ],
					"expiresAt"  : "2042-04-02T00:42:42Z"
				} );

				// debug( result );
				expect( result ).toBeStruct();
				expect( result.name ).toBe( "cbMeilisearch Test Key" );
				expect( result.description ).toBe( "Add documents: Movies API key" );
				variables.testKey = result.key;
			} );

			it( "+getKey", function(){
				var result = model.getKey( variables.testKey );

				// debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+updateKey", function(){
				var result = model.updateKey(
					variables.testKey,
					{
						"name"       : "Test Harness Key",
						"description": "Movies API key - build and populate Movies index"
					}
				);

				// debug( result );
				expect( result ).toBeStruct();
				expect( result.name ).toBe( "Test Harness Key" );
				expect( result.description ).toBe( "Movies API key - build and populate Movies index" );
			} );

			it( "+deleteKey", function(){
				var result = model.deleteKey( variables.testKey );

				// debug( result );
				// expect( result ).toBe( toBinary( "" ) ); // works on Lucee
				// expect( result ).toBe( "" ); // works on ACF
			} );
		} );
	}

}
