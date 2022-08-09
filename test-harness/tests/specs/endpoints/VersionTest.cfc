/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.api.Version" {

	function run(){
		describe( "Version Suite", function(){
			it( "+getVersion", function(){
				var result = model.getVersion();

				// debug( result );
				expect( result ).toBeStruct();
			} );
		} );
	}

}
