/**
 * I model the Meilisearch Indexes API
 *
 * @link https://docs.meilisearch.com/reference/api/indexes.html
 */
component accessors="true" extends="BaseRequest" {

	/**
	 * List All Indexes
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#list-all-indexes
	 */
	public function getAllIndexes( struct params = {} ){
		return handleResponse(
			MeilisearchClient
				.setQueryParams( arguments.params )
				.get( "/indexes" )
		);
	}

	/**
	 * Get one index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#get-one-index
	 */
	public function getIndex( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#" ) );
	}

	/**
	 * Create an index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#create-an-index
	 */
	public function createIndex( required string uid, struct params = {} ){
		arguments.params[ "uid" ] = arguments.uid;
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.params )
				.asJson()
				.post( "/indexes" )
		);
	}

	/**
	 * Update an index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#update-an-index
	 */
	public function updateIndex( required string uid, struct params = {} ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.params )
				.asJson()
				.patch( "/indexes/#arguments.uid#" )
		);
	}

	/**
	 * Delete an index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#delete-an-index
	 */
	public function deleteIndex( required string uid ){
		return handleResponse( MeilisearchClient.delete( "/indexes/#arguments.uid#" ) );
	}

}
