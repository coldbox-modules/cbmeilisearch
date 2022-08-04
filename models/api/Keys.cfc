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
	public function list( numeric offset, numeric limit ){
		return handleResponse(
			MeilisearchClient
				.setQueryParams(
					buildArgs( {
						"offset" : arguments.offset ?: javacast( "null", 0 ),
						"limit"  : arguments.limit ?: javacast( "null", 0 )
					} )
				)
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
				.setBody(
					buildArgs( {
						"actions"     : arguments.actions ?: javacast( "null", 0 ),
						"name"        : arguments.name ?: javacast( "null", 0 ),
						"description" : arguments.description ?: javacast( "null", 0 ),
						"indexes"     : arguments.indexes ?: javacast( "null", 0 ),
						"expiresAt"   : arguments.expiresAt ?: javacast( "null", 0 )
					} )
				)
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
				.setBody( {
					"name"        : arguments.name,
					"description" : arguments.description
				} )
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
