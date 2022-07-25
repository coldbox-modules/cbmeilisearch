/**
 * I model the Meilisearch Settings API
 *
 * @link https://docs.meilisearch.com/reference/api/settings.html
 */
component accessors="true" extends="BaseRequest" {

	/**
	 * Get All Index Settings
	 *
	 * @link https://docs.meilisearch.com/reference/api/settings.html#get-settings
	 */
	public function getSettings( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings" ) );
	}

	/**
	 * Update Index Settings
	 *
	 * @link https://docs.meilisearch.com/reference/api/settings.html#update-settings
	 */
	public function updateSettings( required string uid, required struct settings ){
		return handleResponse(
            MeilisearchClient
                .withHeaders( { "Content-Type" : "application/json" } )
                .setBody( arguments.settings )
                .patch( "/indexes/#arguments.uid#/settings" )
        );
	}

	/**
	 * Reset Index Settings
	 *
	 * @link https://docs.meilisearch.com/reference/api/settings.html#reset-settings
	 */
	public function resetSettings( required string uid ){
		return handleResponse( MeilisearchClient.delete( "/indexes/#arguments.uid#/settings" ) );
	}

	/**
	 * Get Displayed Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/displayed_attributes.html#get-displayed-attributes
	 */
	public function getDisplayedAttributes( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings/displayed-attributes" ) );
	}

	/**
	 * Update Displayed Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/displayed_attributes.html#update-displayed-attributes
	 */
	public function updateDisplayedAttributes( required string uid, required array attributes ){
		return handleResponse(
			MeilisearchClient
				.withHeaders( { "Content-Type" : "application/json" } )
				.setBody( arguments.attributes )
				.put( "/indexes/#arguments.uid#/settings/displayed-attributes" )
		);
	}

	/**
	 * Reset Displayed Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/displayed_attributes.html#reset-displayed-attributes
	 */
	public function resetDisplayedAttributes( required string uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.uid#/settings/displayed-attributes" )
		);
	}

	/**
	 * Get Distinct Attribute
	 *
	 * @link https://docs.meilisearch.com/reference/api/distinct_attribute.html#get-distinct-attribute
	 */
	public function getDistinctAttribute( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings/distinct-attribute" ) );
	}

	/**
	 * Update Distinct Attribute
	 *
	 * @link https://docs.meilisearch.com/reference/api/distinct_attribute.html#update-distinct-attribute
	 */
	public function updateDistinctAttribute( required string uid, required string attribute ){
		return handleResponse(
			MeilisearchClient
				.setBody( '"#arguments.attribute#"' )
				.withHeaders( { "Content-Type" : "application/json" } )
				.put( "/indexes/#arguments.uid#/settings/distinct-attribute" )
		);
	}

	/**
	 * Reset Distinct Attribute
	 *
	 * @link https://docs.meilisearch.com/reference/api/distinct_attribute.html#reset-distinct-attribute
	 */
	public function resetDistinctAttribute( required string uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.uid#/settings/distinct-attribute" )
		);
	}

	/**
	 * Get Faceting Settings
	 *
	 * @link https://docs.meilisearch.com/reference/api/faceting.html#get-faceting-settings
	 */
	public function getFacetingSettings( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings/faceting" ) );
	}

	/**
	 * Update Faceting Settings
	 *
	 * @link https://docs.meilisearch.com/reference/api/faceting.html#update-faceting-settings
	 */
	public function updateFacetingSettings( required string uid, required struct settings ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.settings )
				.withHeaders( { "Content-Type" : "application/json" } )
				.patch( "/indexes/#arguments.uid#/settings/faceting" )
		);
	}

	/**
	 * Reset Faceting Settings
	 *
	 * @link https://docs.meilisearch.com/reference/api/faceting.html#get-faceting-settings
	 */
	public function resetFacetingSettings( required string uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.uid#/settings/faceting" )
		);
	}

	/**
	 * Get Filterable Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/filterable_attributes.html#get-filterable-attributes
	 */
	public function getFilterableAttributes( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings/filterable-attributes" ) );
	}

	/**
	 * Update Filterable Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/filterable_attributes.html#update-filterable-attributes
	 */
	public function updateFilterableAttributes( required string uid, required array attributes ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.attributes )
				.withHeaders( { "Content-Type" : "application/json" } )
				.put( "/indexes/#arguments.uid#/settings/filterable-attributes" )
		);
	}

	/**
	 * Reset Filterable Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/filterable_attributes.html#reset-filterable-attributes
	 */
	public function resetFilterableAttributes( required string uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.uid#/settings/filterable-attributes" )
		);
	}

	/**
	 * Get Pagination Settings
	 *
	 * @link https://docs.meilisearch.com/reference/api/pagination.html#get-pagination-settings
	 */
	public function getPaginationSettings( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings/pagination" ) );
	}

	/**
	 * Update Pagination Settings
	 *
	 * @link https://docs.meilisearch.com/reference/api/pagination.html#update-pagination-settings
	 */
	public function updatePaginationSettings( required string uid, required struct settings ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.settings )
				.withHeaders( { "Content-Type" : "application/json" } )
				.patch( "/indexes/#arguments.uid#/settings/pagination" )
		);
	}

	/**
	 * Reset Pagination Settings
	 *
	 * @link https://docs.meilisearch.com/reference/api/pagination.html#reset-pagination-settings
	 */
	public function resetPaginationSettings( required string uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.uid#/settings/pagination" )
		);
	}

	/**
	 * Get Ranking Rules
	 *
	 * @link https://docs.meilisearch.com/reference/api/ranking_rules.html#get-ranking-rules
	 */
	public function getRankingRules( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings/ranking-rules" ) );
	}

	/**
	 * Update Ranking Rules
	 *
	 * @link https://docs.meilisearch.com/reference/api/ranking_rules.html#update-ranking-rules
	 */
	public function updateRankingRules( required string uid, required array rules ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.rules )
				.withHeaders( { "Content-Type" : "application/json" } )
				.put( "/indexes/#arguments.uid#/settings/ranking-rules" )
		);
	}

	/**
	 * Reset Ranking Rules
	 *
	 * @link https://docs.meilisearch.com/reference/api/ranking_rules.html#reset-ranking-rules
	 */
	public function resetRankingRules( required string uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.uid#/settings/ranking-rules" )
		);
	}

	/**
	 * Get Searchable Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/searchable_attributes.html#get-searchable-attributes
	 */
	public function getSearchableAttributes( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings/searchable-attributes" ) );
	}

	/**
	 * Update Searchable Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/searchable_attributes.html#update-searchable-attributes
	 */
	public function updateSearchableAttributes( required string uid, required array attributes ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.attributes )
				.withHeaders( { "Content-Type" : "application/json" } )
				.put( "/indexes/#arguments.uid#/settings/searchable-attributes" )
		);
	}

	/**
	 * Reset Searchable Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/searchable_attributes.html#reset-searchable-attributes
	 */
	public function resetSearchableAttributes( required string uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.uid#/settings/searchable-attributes" )
		);
	}

	/**
	 * Get Sortable Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/sortable_attributes.html#get-sortable-attributes
	 */
	public function getSortableAttributes( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings/sortable-attributes" ) );
	}

	/**
	 * Update Sortable Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/sortable_attributes.html#update-sortable-attributes
	 */
	public function updateSortableAttributes( required string uid, required array attributes ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.attributes )
				.withHeaders( { "Content-Type" : "application/json" } )
				.put( "/indexes/#arguments.uid#/settings/sortable-attributes" )
		);
	}

	/**
	 * Reset Sortable Attributes
	 *
	 * @link https://docs.meilisearch.com/reference/api/sortable_attributes.html#reset-sortable-attributes
	 */
	public function resetSortableAttributes( required string uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.uid#/settings/sortable-attributes" )
		);
	}

	/**
	 * Get Stop-words
	 *
	 * @link https://docs.meilisearch.com/reference/api/stop_words.html#get-stop-words
	 */
	public function getStopWords( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings/stop-words" ) );
	}

	/**
	 * Update Stop-words
	 *
	 * @link https://docs.meilisearch.com/reference/api/stop_words.html#update-stop-words
	 */
	public function updateStopWords( required string uid, required array stopWords ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.stopWords )
				.withHeaders( { "Content-Type" : "application/json" } )
				.put( "/indexes/#arguments.uid#/settings/stop-words" )
		);
	}

	/**
	 * Reset Stop-words
	 *
	 * @link https://docs.meilisearch.com/reference/api/stop_words.html#reset-stop-words
	 */
	public function resetStopWords( required string uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.uid#/settings/stop-words" )
		);
	}

	/**
	 * Get Synonyms
	 *
	 * @link https://docs.meilisearch.com/reference/api/synonyms.html#get-synonyms
	 */
	public function getSynonyms( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings/synonyms" ) );
	}

	/**
	 * Update Synonyms
	 *
	 * @link https://docs.meilisearch.com/reference/api/synonyms.html#update-synonyms
	 */
	public function updateSynonyms( required string uid, required struct synonyms ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.synonyms )
				.withHeaders( { "Content-Type" : "application/json" } )
				.put( "/indexes/#arguments.uid#/settings/synonyms" )
		);
	}

	/**
	 * Reset Synonyms
	 *
	 * @link https://docs.meilisearch.com/reference/api/synonyms.html#reset-synonyms
	 */
	public function resetSynonyms( required string uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.uid#/settings/synonyms" )
		);
	}

	/**
	 * Get Typo Tolerance
	 *
	 * @link https://docs.meilisearch.com/reference/api/typo_tolerance.html#get-typo-tolerance
	 */
	public function getTypoTolerance( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#/settings/typo-tolerance" ) );
	}

	/**
	 * Update Typo Tolerance
	 *
	 * @link https://docs.meilisearch.com/reference/api/typo_tolerance.html#update-typo-tolerance
	 */
	public function updateTypoTolerance( required string uid, required struct settings ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.settings )
				.withHeaders( { "Content-Type" : "application/json" } )
				.patch( "/indexes/#arguments.uid#/settings/typo-tolerance" )
		);
	}

	/**
	 * Reset Typo Tolerance
	 *
	 * @link https://docs.meilisearch.com/reference/api/typo_tolerance.html#reset-typo-tolerance
	 */
	public function resetTypoTolerance( required string uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.uid#/settings/typo-tolerance" )
		);
	}
}
