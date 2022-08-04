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
	public function list(
		numeric offset,
		numeric limit
	){
		return handleResponse(
			MeilisearchClient
				.setQueryParams( buildArgs( arguments ) )
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
		required array actions,
		string name,
		string description,
		array indexes,
		string expiresAt
	){
		return handleResponse(
			MeilisearchClient
				.setBody( {
					"actions"    : arguments.actions,
					"name"       : arguments.name,
					"description": arguments.description,
					"indexes"    : arguments.indexes,
					"expiresAt"  : arguments.expiresAt
				} )
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
		string name,
		string description
	){
		return handleResponse(
			MeilisearchClient
				.setBody( buildArgs( args = arguments, discard = [ "key" ] ) )
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
