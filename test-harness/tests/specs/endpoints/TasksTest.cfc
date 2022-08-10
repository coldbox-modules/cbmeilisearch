/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.endpoints.Tasks" {

	variables.testTaskUID = "no_worky";

	function run(){
		describe( "Tasks Suite", function(){
			it( "+getAllTasks", function(){
				var result = model.getAllTasks();

				// debug( result );
				expect( result ).toBeStruct();

				variables.testTaskUID = result.results.first().uid;
			} );
			it( "+getAllTasks with pagination", function(){
				var result = model.getAllTasks( {
					"limit": 2,
					"from" : variables.testTaskUID
				} );

				// debug( result );
				expect( result ).toBeStruct();
			} );
			it( "+getAllTasks with filter", function(){
				var result = model.getAllTasks( {
					"status": "succeeded",
					"type"  : "indexCreation"
				} );

				// debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+getTask", function(){
				var result = model.getTask( variables.testTaskUID );

				// debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+getAllTasks with index filter", function(){
				var result = model.getAllTasks( { 
					"indexUid" : "products"
				} );

				// debug( result );
				expect( result ).toBeStruct();
			} );
		} );
	}

}
