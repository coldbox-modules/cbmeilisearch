/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.api.Search" {

	function beforeAll(){
		super.beforeAll();

        addTestDocuments();
	}

	function run(){
		describe( "Search Suite", function(){
			it( "+searchWithPost", function(){
				var result = model.searchWithPost(
                    index = "products",
                    q = "Wristwatch"
                );

				debug( result );
				expect( result ).toBeStruct();
			} );
			it( "+searchWithGet", function(){
				var result = model.searchWithGet(
                    index = "products",
                    q = "Wristwatch"
                );

				debug( result );
				expect( result ).toBeStruct();
			} );
		} );
	}

    function addTestDocuments(){
        var documents = [
            {
                "id"    : "99",
                "title" : "Bulova Men's Leather Wrist Watch",
                "cost" : "49.99"
            },
            {
                "id"    : "11",
                "title" : "Bulova Men's Stainless Steel Bracelet Watch",
                "cost" : "49.99"
            },
            {
                "id"    : "76",
                "title" : "Timex Men's BST.47 Black Silicone Strap Watch",
                "cost" : "96.99"
            }
        ];
        var result = getWirebox().getInstance( "Documents@cbmeilisearch" ).addOrReplace(
            index  = "products",
            documents  = documents,
            primaryKey = "id"
        );
    }
}
