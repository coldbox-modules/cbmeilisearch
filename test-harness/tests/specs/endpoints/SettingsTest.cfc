/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.BaseModelTest" model="cbmeilisearch.models.endpoints.Settings" {

	variables.taskIds = [];

	function run(){
		describe( "Settings", function(){
			it( "+getSettings", function(){
				var result = model.getSettings( "products" );

				// debug( result );
				expect( result ).toBeStruct();
			} );
			it( "+updateSettings", function(){
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
			it( "+resetSettings", function(){
				var result = model.resetSettings( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+getDisplayedAttributes", function(){
				var result = model.getDisplayedAttributes( "products" );
				// debug( result );
				expect( result ).toBeArray().toHaveLength( 1 );
				expect( result.first() ).toBe( "*" );
			} );
			it( "+updateDisplayedAttributes", function(){
				var result = model.updateDisplayedAttributes( "products", [ "title", "price" ] );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+resetDisplayedAttributes", function(){
				var result = model.resetDisplayedAttributes( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+getDistinctAttribute", function(){
				var result = model.getDistinctAttribute( "products" );
				expect( isNull( result ) ).toBeTrue();
			} );
			it( "+updateDistinctAttribute", function(){
				var result = model.updateDistinctAttribute( "products", "id" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+resetDistinctAttribute", function(){
				var result = model.resetDistinctAttribute( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+getFacetingSettings", function(){
				var result = model.getFacetingSettings( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "maxValuesPerFacet" );
			} );
			it( "+updateFacetingSettings", function(){
				var result = model.updateFacetingSettings( "products", { "maxValuesPerFacet" : 20 } );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+resetFacetingSettings", function(){
				var result = model.resetFacetingSettings( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+getFilterableAttributes", function(){
				var result = model.getFilterableAttributes( "products" );
				// debug( result );
				expect( result ).toBeArray().toHaveLength( 0 );
			} );
			it( "+updateFilterableAttributes", function(){
				var result = model.updateFilterableAttributes( "products", [ "price", "category" ] );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+resetFilterableAttributes", function(){
				var result = model.resetFilterableAttributes( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+getPaginationSettings", function(){
				var result = model.getPaginationSettings( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "maxTotalHits" );
			} );
			it( "+updatePaginationSettings", function(){
				var result = model.updatePaginationSettings( "products", { "maxTotalHits" : 20 } );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+resetPaginationSettings", function(){
				var result = model.resetPaginationSettings( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+getRankingRules", function(){
				var result = model.getRankingRules( "products" );
				// debug( result );
				expect( result ).toBeArray().toHaveLength( 6 );
			} );
			it( "+updateRankingRules", function(){
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
			it( "+resetRankingRules", function(){
				var result = model.resetRankingRules( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+getSearchableAttributes", function(){
				var result = model.getSearchableAttributes( "products" );
				// debug( result );
				expect( result ).toBeArray().toHaveLength( 1 );
				expect( result.first() ).toBe( "*" );
			} );
			it( "+updateSearchableAttributes", function(){
				var result = model.updateSearchableAttributes( "products", [ "title", "price" ] );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
			} );
			it( "+resetSearchableAttributes", function(){
				var result = model.resetSearchableAttributes( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+getSortableAttributes", function(){
				var result = model.getSortableAttributes( "products" );
				// debug( result );
				expect( result ).toBeArray().toHaveLength( 0 );
			} );
			it( "+updateSortableAttributes", function(){
				var result = model.updateSortableAttributes( "products", [ "title", "price" ] );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+resetSortableAttributes", function(){
				var result = model.resetSortableAttributes( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+getStopWords", function(){
				var result = model.getStopWords( "products" );
				// debug( result );
				expect( result ).toBeArray().toHaveLength( 0 );
			} );
			it( "+updateStopWords", function(){
				var result = model.updateStopWords( "products", [ "of", "the", "and" ] );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+resetStopWords", function(){
				var result = model.resetStopWords( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+getSynonyms", function(){
				var result = model.getSynonyms( "products" );
				// debug( result );
				expect( result ).toBeStruct().toBeEmpty();
			} );
			it( "+updateSynonyms", function(){
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
			it( "+resetSynonyms", function(){
				var result = model.resetSynonyms( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "+getTypoTolerance", function(){
				var result = model.getTypoTolerance( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "minWordSizeForTypos" );
			} );
			it( "+updateTypoTolerance", function(){
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
			it( "+resetTypoTolerance", function(){
				var result = model.resetTypoTolerance( "products" );
				// debug( result );
				expect( result ).toBeStruct().toHaveKey( "enqueuedAt" );
				variables.taskIds.append( result.taskUid );
			} );
			it( "All tasks succeeded", function(){
				var tasksAPI = getWirebox().getInstance( "Tasks@cbmeilisearch" );
				variables.taskIds.each( ( taskUID ) => {
					var result = tasksAPI.getTask( taskUID );
					// debug( result );
					expect( result.status ).toBe( "succeeded" );
				} )
			} );
		} );
	}

}
