component extends="coldbox.system.testing.BaseTestCase" appMapping="root" {

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		setup();

        variables.model = getWirebox().getInstance( "Client@cbmeilisearch" );
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){
		describe( "cbMeilisearch.Client", function(){
            it( "can initiate", function(){
                expect( variables.model ).toBeInstanceOf( "cbmeilisearch.models.Client" );
            });

            describe( "Indexes", function() {

                it( "can create index", function() {
                    var resultTask = variables.model.createIndex( "movies", { "primaryKey" : "id" } );
                    var result = variables.model.waitForTask( resultTask.taskUid );
                });

                it( "can get index", function() {
                    variables.model.getIndex( "movies" );
                });

                it( "can get ALL indexes", function() {
                    variables.model.getAllIndexes({ "limit" : 20, "offset" : 1 } );
                });

                it( "can delete index", function() {
                    variables.model.deleteIndex( "movies" );
                });
            });

            describe( "Documents", function() {
                beforeEach(function(){
                    if ( !variables.keyExists( "testDocument" ) ){
                        variables.testDocument = {
                            "id"       : "111",
                            "title"    : "Deluxe Silver Digital Watch",
                            "category" : "watches"
                        };
                        var resultTask = variables.model.addDocuments( "products", [ variables.testDocument ]);

                        variables.model.waitForTask( resultTask.taskUid );
                    }
                });
                it( "can get single document", function() {
                    variables.model.getDocument( "products", variables.testDocument.id );
                });
                it( "can get all documents", function() {
                    variables.model.getDocuments( "products", {
                        "limit" : 50,
                        "offset" : "12"
                    });
                });
                it( "can add multiple documents", function() {
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
                });
                it( "can update multiple documents", function() {
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
                });

                it( "can delete one document", function(){
                    var result = model.deleteDocument( index = "products", document_id = "111" );
    
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "type" );
                    expect( result.type ).toBe( "documentDeletion" );
                } );
    
                it( "can delete by batch", function(){
                    var result = model.deleteDocuments( index = "products", document_ids = [ "3767", "22" ] );
    
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "type" );
                    expect( result.type ).toBe( "documentDeletion" );
                } );
    
                it( "can delete all documents", function(){
                    var result = model.deleteAllDocuments( "products" );
    
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "type" );
                    expect( result.type ).toBe( "documentDeletion" );
                } );
            });

            describe( "Tasks", function() {
                it( "can get tasks", function() {
                    variables.model.getAllTasks();
                });

                it( "can get single task", function() {
                    var exampleTask = variables.model.createIndex( "example" );
                    var result = variables.model.getTask( exampleTask.taskUid );
                });
            });

            describe( "Keys", function() {

                beforeEach(function(){
                    if ( !variables.keyExists( "testKey" ) ){
                        variables.testKey = variables.model.createKey({
                            "name"       : "Basic API key",
                            "description": "Only used for searching.",
                            "actions" : [ "search" ],
                            "indexes" : [ "*" ],
                            "expiresAt" : javaCast( "null", 0 )
                        });
                    }
                });

                it( "can get keys", function() {
                    variables.model.getAllKeys();
                });
    
                it( "can create key", function() {
                    expect( variables.testKey ).toBeStruct().toHaveKey( "uid" );
                });
    
                it( "can get single key", function() {
                    variables.model.getKey( variables.testKey.uid );
                });
    
                it( "can update key", function() {
                    var key = variables.model.updateKey(
                        variables.testKey.uid,
                        {
                            "name"       : "Search-only API key",
                            "description": "Only used for searching."
                        }
                    );
                });
    
                it( "can delete key", function() {
                    variables.model.deleteKey( variables.testKey.uid );
                    // TODO: Uncomment when we switch to returning the HyperResponse object.
                    // var isDeleted = variables.model.getKey( variables.testKey.uid );
                    // expect( isDeleted.getStatusCode() ).toBe( 404 );
                });
            });

            describe( "Settings", function() {
                it( "can get settings", function() {
                    var result = variables.model.getSettings( "products" );
                    expect( result ).toBeStruct();
                });
                it( "can update settings", function() {
                    var result = variables.model.updateSettings(
                        "products",
                        {
                            "filterableAttributes" : [ "category" ],
                            "stopWords"            : [ "the", "and", "or", "but", "not" ]
                        }
                    );
                    expect( result ).toBeStruct();
                });
                it( "can reset settings", function() {
                    var result = variables.model.resetSettings( "products");
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                });
            });

            describe( "Settings", function(){
                variables.taskIds = [];
                it( "getSettings", function(){
                    var result = model.getSettings( "products" );

                    // debug( result );
                    expect( result ).toBeStruct();
                } );
                it( "updateSettings", function(){
                    var result = model.updateSettings(
                        "products",
                        {
                            "filterableAttributes" : [ "category" ],
                            "stopWords"            : [ "the", "and", "or", "but", "not" ]
                        }
                    );

                    // debug( result );
                    expect( result ).toBeStruct();
                    variables.taskIds.append( result.taskUid );
                } );
                it( "resetSettings", function(){
                    var result = model.resetSettings( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "getDisplayedAttributes", function(){
                    var result = model.getDisplayedAttributes( "products" );
                    // debug( result );
                    expect( result ).toBeArray().toHaveLength( 1 );
                    expect( result.first() ).toBe( "*" );
                } );
                it( "updateDisplayedAttributes", function(){
                    var result = model.updateDisplayedAttributes( "products", [ "title", "price" ] );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "resetDisplayedAttributes", function(){
                    var result = model.resetDisplayedAttributes( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "getDistinctAttribute", function(){
                    var result = model.getDistinctAttribute( "products" );
                    expect( isNull( result ) ).toBeTrue();
                } );
                it( "updateDistinctAttribute", function(){
                    var result = model.updateDistinctAttribute( "products", "id" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "resetDistinctAttribute", function(){
                    var result = model.resetDistinctAttribute( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "getFacetingSettings", function(){
                    var result = model.getFacetingSettings( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "maxValuesPerFacet" );
                } );
                it( "updateFacetingSettings", function(){
                    var result = model.updateFacetingSettings( "products", { "maxValuesPerFacet" : 20 } );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "resetFacetingSettings", function(){
                    var result = model.resetFacetingSettings( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "getFilterableAttributes", function(){
                    var result = model.getFilterableAttributes( "products" );
                    // debug( result );
                    expect( result ).toBeArray().toHaveLength( 0 );
                } );
                it( "updateFilterableAttributes", function(){
                    var result = model.updateFilterableAttributes( "products", [ "price", "category" ] );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "resetFilterableAttributes", function(){
                    var result = model.resetFilterableAttributes( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "getPaginationSettings", function(){
                    var result = model.getPaginationSettings( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "maxTotalHits" );
                } );
                it( "updatePaginationSettings", function(){
                    var result = model.updatePaginationSettings( "products", { "maxTotalHits" : 20 } );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "resetPaginationSettings", function(){
                    var result = model.resetPaginationSettings( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "getRankingRules", function(){
                    var result = model.getRankingRules( "products" );
                    // debug( result );
                    expect( result ).toBeArray().toHaveLength( 6 );
                } );
                it( "updateRankingRules", function(){
                    var result = model.updateRankingRules(
                        "products",
                        [
                            "words",
                            "typo",
                            "proximity",
                            "attribute",
                            "sort",
                            "exactness",
                            "release_date:desc"
                        ]
                    );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "resetRankingRules", function(){
                    var result = model.resetRankingRules( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "getSearchableAttributes", function(){
                    var result = model.getSearchableAttributes( "products" );
                    // debug( result );
                    expect( result ).toBeArray().toHaveLength( 1 );
                    expect( result.first() ).toBe( "*" );
                } );
                it( "updateSearchableAttributes", function(){
                    var result = model.updateSearchableAttributes( "products", [ "title", "price" ] );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                } );
                it( "resetSearchableAttributes", function(){
                    var result = model.resetSearchableAttributes( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "getSortableAttributes", function(){
                    var result = model.getSortableAttributes( "products" );
                    // debug( result );
                    expect( result ).toBeArray().toHaveLength( 0 );
                } );
                it( "updateSortableAttributes", function(){
                    var result = model.updateSortableAttributes( "products", [ "title", "price" ] );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "resetSortableAttributes", function(){
                    var result = model.resetSortableAttributes( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "getStopWords", function(){
                    var result = model.getStopWords( "products" );
                    // debug( result );
                    expect( result ).toBeArray().toHaveLength( 0 );
                } );
                it( "updateStopWords", function(){
                    var result = model.updateStopWords( "products", [ "of", "the", "and" ] );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "resetStopWords", function(){
                    var result = model.resetStopWords( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "getSynonyms", function(){
                    var result = model.getSynonyms( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toBeEmpty();
                } );
                it( "updateSynonyms", function(){
                    var result = model.updateSynonyms(
                        "products",
                        {
                            "Michael" : [ "strong", "intelligent" ],
                            "Born"    : [ "Bourne", "Jason" ]
                        }
                    );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "resetSynonyms", function(){
                    var result = model.resetSynonyms( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "getTypoTolerance", function(){
                    var result = model.getTypoTolerance( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "minWordSizeForTypos" );
                } );
                it( "updateTypoTolerance", function(){
                    var result = model.updateTypoTolerance(
                        "products",
                        {
                            "enabled"             : true,
                            "disableOnWords"      : [ "lowes" ],
                            "disableOnAttributes" : [ "name" ]
                        }
                    );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "resetTypoTolerance", function(){
                    var result = model.resetTypoTolerance( "products" );
                    // debug( result );
                    expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
                    variables.taskIds.append( result.taskUid );
                } );
                it( "All tasks succeeded", function(){
                    variables.taskIds.each( ( taskUID ) => {
                        var result = model.getTask( taskUID );
                        // debug( result );
                        expect( result.status ).toBe( "succeeded" );
                    } )
                } );
            } );
            describe( "Dumps", function(){
                it( "can create dump", function(){
                    var result = model.createDump();
    
                    // debug( result );
                    expect( result ).toBeStruct();
                } );
            } );
            describe( "Version", function(){
                it( "can get version", function(){
                    var result = model.version();
    
                    // debug( result );
                    expect( result ).toBeStruct();
                } );
            } );
            describe( "Stats", function(){
                it( "can get individual index stats", function(){
                    var result = model.stats( "products" );
    
                    // debug( result );
                    expect( result ).toBeStruct();
                } );
    
                it( "can get all stats for all indexes", function(){
                    var result = model.stats();
    
                    // debug( result );
                    expect( result ).toBeStruct();
                } );
            } );
		} );
	}

}
