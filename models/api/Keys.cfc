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
	public function list(){
		return handleResponse( MeilisearchClient.get( "/keys" ) );
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
		required array actions,
		string description,
		array indexes,
		string expiresAt
	){
		return handleResponse(
			MeilisearchClient
				.setBody( {
					"actions"    : arguments.actions,
					"description": arguments.description,
					"indexes"    : arguments.indexes,
					"expiresAt"  : arguments.expiresAt
				} )
				.withHeaders( { "Content-Type" : "application/json" } )
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
		required array actions,
		string description,
		array indexes,
		string expiresAt
	){
		return handleResponse(
			MeilisearchClient
				.setBody( buildArgs( args = arguments, discard = [ "key" ] ) )
				.withHeaders( { "Content-Type" : "application/json" } )
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
