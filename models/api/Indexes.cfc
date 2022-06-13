/**
 * I model the Meilisearch Indexes API
 *
 * @link https://docs.meilisearch.com/reference/api/indexes.html
 */
component accessors="true" extends="../BaseRequest" {

	/**
	 * List All Indexes
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#list-all-indexes
	 */
	public function list(){
		return handleResponse( MeilisearchClient.get( "/indexes" ) );
	}

	/**
	 * Get one index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#get-one-index
	 */
	public function get( required string uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.uid#" ) );
	}

	/**
	 * Create an index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#create-an-index
	 */
	public function create( required string uid, required string primaryKey ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments )
				.withHeaders( { "Content-Type" : "application/json" } )
				.post( "/indexes" )
		);
	}

	/**
	 * Update an index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#update-an-index
	 */
	public function update( required string uid, required string primaryKey ){
		return handleResponse(
			MeilisearchClient
				.setBody( buildArgs( arguments, [ "primaryKey" ] ) )
				.withHeaders( { "Content-Type" : "application/json" } )
				.put( "/indexes/#arguments.uid#" )
		);
	}

	/**
	 * Delete an index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#delete-an-index
	 */
	public function delete( required string uid ){
		return handleResponse( MeilisearchClient.delete( "/indexes/#arguments.uid#" ) );
	}

}
