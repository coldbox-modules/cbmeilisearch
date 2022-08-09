/**
 * I model the Meilisearch Keys API
 *
 * @link https://docs.meilisearch.com/reference/api/keys.html
 */
component accessors="true" extends="BaseRequest" {

	/**
	 * Get all keys
	 *
	 * @link https://docs.meilisearch.com/reference/api/keys.html#get-all-keys
	 */
	public function list( struct params = {} ){
		return handleResponse(
			MeilisearchClient
				.setQueryParams( arguments.params )
				.get( "/keys" )
		);
	}

	/**
	 * Get one key
	 *
	 * @link https://docs.meilisearch.com/reference/api/keys.html#get-one-key
	 */
	public function get( required string key ){
		return handleResponse( MeilisearchClient.get( "/keys/#arguments.key#" ) );
	}

	/**
	 * Create a key
	 *
	 * @link https://docs.meilisearch.com/reference/api/keys.html#create-a-key
	 */
	public function create(
		required struct params
	){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.params )
				.asJson()
				.post( "/keys" )
		);
	}

	/**
	 * Update a key
	 *
	 * @link https://docs.meilisearch.com/reference/api/keys.html#update-a-key
	 */
	public function update(
		required string key,
		required struct params
	){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.params )
				.asJson()
				.patch( "/keys/#arguments.key#" )
		);
	}

	/**
	 * Delete a key
	 *
	 * @link https://docs.meilisearch.com/reference/api/keys.html#delete-a-key
	 */
	public function delete( required string key ){
		return handleResponse( MeilisearchClient.delete( "/keys/#arguments.key#" ) );
	}

}
