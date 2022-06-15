/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.api.Tasks" {

	variables.testTaskUID = "no_worky";

	function run(){
		describe( "Tasks Suite", function(){
			it( "+list", function(){
				var result = model.list();

				// debug( result );
				expect( result ).toBeStruct();

				variables.testTaskUID = result.results.first().uid;
			} );

			it( "+get", function(){
				var result = model.get( variables.testTaskUID );

				// debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+getAllByIndex", function(){
				var result = model.getAllByIndex( "products" );

				// debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+getByIndex", function(){
				var result = model.getByIndex( "products", variables.testTaskUID );

				// debug( result );
				expect( result ).toBeStruct();
			} );
		} );
	}

}
