/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.api.Search" {

	function beforeAll(){
		super.beforeAll();
	}

	function run(){
		describe( "Search Suite", function(){
			it( "+searchWithPost", function(){
				var result = model.searchWithPost( index = "products", q = "Wallet" );

				debug( result );
				expect( result ).toBeStruct();
			} );
			it( "+searchWithGet", function(){
				var result = model.searchWithGet( index = "products", q = "Wallet" );

				debug( result );
				expect( result ).toBeStruct();
			} );
			it( "+searchWithPost, all arguments", function(){
				var result = model.searchWithPost(
					index                 = "products",
					q                     = "Watch",
					offset                = 1,
					limit                 = 10,
					filter                = "manufactureYear = 2008",
					facets                = [ "category" ],
					attributesToRetrieve  = [ "id", "title", "manufactureYear", "category" ],
					attributesToCrop      = [ "title" ],
					cropLength            = 15,
					cropMarker            = "...",
					attributesToHighlight = [ "title" ],
					highlightPreTag       = "<em class=""search_highlight"">",
					highlightPostTag      = "</em>",
					showMatchesPosition   = true,
					sort                  = [ "manufactureYear:asc" ]
				);

				// debug( result );
				expect( result ).toBeStruct();
			} );
		} );
	}

}
