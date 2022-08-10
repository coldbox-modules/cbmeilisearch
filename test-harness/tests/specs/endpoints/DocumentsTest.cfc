/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.endpoints.Documents" {

	variables.index = "";

	function run(){
		describe( "Documents Suite", function(){
			it( "+getDocuments", function(){
				var result = model.getDocuments(
					"products",
					{
						"offset" : 0,
						"limit"  : 5,
						"fields" : "*"
					}
				);

				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "results" );
				expect( result.results ).toBeArray();
			} );

			it( "+addDocuments", function(){
				var documents = [
					{
						"id"       : "111",
						"title"    : "Deluxe Silver Digital Watch",
						"category" : "watches"
					},
					{
						"id"       : "217",
						"title"    : "Deluxe Leather Analog Watch",
						"category" : "watches"
					},
					{
						"id"       : "3767",
						"title"    : "Men's Leather Billfold",
						"category" : "wallets"
					}
				];
				var result = model.addDocuments(
					index      = "products",
					documents  = documents,
					primaryKey = "id"
				);

				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "type" );
				expect( result.type ).toBe( "documentAdditionOrUpdate" );
			} );

			it( "+updateDocuments", function(){
				var documents = [
					{
						"id"              : "111",
						"title"           : "Deluxe Silver Digital Watch",
						"category"        : "watches",
						"manufactureYear" : "2016"
					},
					{
						"id"              : "217",
						"title"           : "Deluxe Leather Analog Watch",
						"category"        : "watches",
						"manufactureYear" : "2016"
					},
					{
						"id"              : "3767",
						"title"           : "Men's Leather Billfold",
						"category"        : "wallets",
						"manufactureYear" : "2008"
					},
					{
						"id"              : "22",
						"title"           : "Groundhog Day",
						"category"        : "jackets",
						"manufactureYear" : "1993"
					}
				];
				var result = model.updateDocuments(
					index      = "products",
					documents  = documents,
					primaryKey = "id"
				);

				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "type" );
				expect( result.type ).toBe( "documentAdditionOrUpdate" );
			} );

			it( "+getDocument", function(){
				var result = model.getDocument( "products", "111" );
				// debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+deleteDocument", function(){
				var result = model.deleteDocument( index = "products", document_id = "111" );

				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "type" );
				expect( result.type ).toBe( "documentDeletion" );
			} );

			it( "+deleteDocuments", function(){
				var result = model.deleteDocuments( index = "products", document_ids = [ "3767", "22" ] );

				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "type" );
				expect( result.type ).toBe( "documentDeletion" );
			} );

			it( "+deleteAllDocuments", function(){
				var result = model.deleteAllDocuments( "products" );

				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "type" );
				expect( result.type ).toBe( "documentDeletion" );
			} );
		} );
	}

}
