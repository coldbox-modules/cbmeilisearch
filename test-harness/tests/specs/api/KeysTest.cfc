/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.api.Keys" {

	variables.testKey = "no_worky";

	function run(){
		describe( "Keys Suite", function(){
			it( "+list", function(){
				var result = model.list();

				debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+create", function(){
				var result = model.create(
					description: "Add documents: Movies API key",
					actions    : [ "documents.add" ],
					indexes    : [ "movies" ],
					expiresAt  : "2042-04-02T00:42:42Z"
				);

				debug( result );
				expect( result ).toBeStruct();
				variables.testKey = result.key;
			} );

			it( "+get", function(){
				var result = model.get( variables.testKey );

				debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+update", function(){
				var result = model.create(
					key        = variables.testKey,
					description: "Movies API key - build and populate Movies index",
					actions    : [
						"documents.add",
						"indexes.create",
						"indexes.update",
						"indexes.delete",
						"tasks.get"
					],
					indexes  : [ "movies" ],
					expiresAt: "2042-04-02T00:42:42Z"
				);

				debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+delete", function(){
				var result = model.delete( variables.testKey );

				debug( result );
				expect( result ).toBe( toBinary( "" ) );
			} );
		} );
	}

}
