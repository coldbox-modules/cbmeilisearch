/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.api.Documents" {

	variables.index = "";

	function run(){
		describe( "Documents Suite", function(){
			it( "+list", function(){
				var result = model.list(
					index            = "products",
					offset               = 0,
					limit                = 5,
					attributesToRetrieve = "*"
				);

				// debug( result );
				expect( result ).toBeArray();
			} );

			it( "+addOrReplace", function(){
				var documents = [
					{
						"id"    : "111",
						"title" : "Star Wars: Rogue One",
						"genre" : "sci-fi"
					},
					{
						"id"    : "217",
						"title" : "Star Trek: Beyond",
						"genre" : "sci-fi"
					},
					{
						"id"    : "3767",
						"title" : "Dark Knight",
						"genre" : "superhero"
					}
				];
				var result = model.addOrReplace(
					index  = "products",
					documents  = documents,
					primaryKey = "id"
				);

				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "type" );
				expect( result.type ).toBe( "documentAddition" );
			} );

			it( "+addOrUpdate", function(){
				var documents = [
					{
						"id"          : "111",
						"title"       : "Star Wars: Rogue One",
						"genre"       : "sci-fi",
						"releaseYear" : "2016"
					},
					{
						"id"          : "217",
						"title"       : "Star Trek: Beyond",
						"genre"       : "sci-fi",
						"releaseYear" : "2016"
					},
					{
						"id"          : "3767",
						"title"       : "Dark Knight",
						"genre"       : "superhero",
						"releaseYear" : "2008"
					},
					{
						"id"          : "22",
						"title"       : "Groundhog Day",
						"genre"       : "comedy",
						"releaseYear" : "1993"
					}
				];
				var result = model.addOrUpdate(
					index  = "products",
					documents  = documents,
					primaryKey = "id"
				);

				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "type" );
				expect( result.type ).toBe( "documentPartial" );
			} );

			it( "+get", function(){
				var result = model.get( "products", "111" );
				// debug( result );
				expect( result ).toBeStruct();
			} );

			it( "+deleteOne", function(){
				var result = model.deleteOne( index = "products", document_id = "111" );

				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "type" );
				expect( result.type ).toBe( "documentDeletion" );
			} );

			it( "+deleteBatch", function(){
				var result = model.deleteBatch( index = "products", document_ids = [ "3767", "22" ] );

				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "type" );
				expect( result.type ).toBe( "documentDeletion" );
			} );

			it( "+deleteAll", function(){
				var result = model.deleteAll( "products" );

				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "type" );
				expect( result.type ).toBe( "clearAll" );
			} );
		} );
	}

}
