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
	public HyperResponse function getAllKeys( struct params = {} ){
		return HyperClient.setQueryParams( arguments.params ).get( "/keys" );
	}

	/**
	 * Get one key
	 *
	 * @link https://docs.meilisearch.com/reference/api/keys.html#get-one-key
	 */
	public HyperResponse function getKey( required string key ){
		return HyperClient.get( "/keys/#arguments.key#" );
	}

	/**
	 * Create a key
	 *
	 * @link https://docs.meilisearch.com/reference/api/keys.html#create-a-key
	 */
	public HyperResponse function createKey( required struct params ){
		return HyperClient
			.setBody( arguments.params )
			.asJson()
			.post( "/keys" );
	}

	/**
	 * Update a key
	 *
	 * @link https://docs.meilisearch.com/reference/api/keys.html#update-a-key
	 */
	public HyperResponse function updateKey( required string key, required struct params ){
		return HyperClient
			.setBody( arguments.params )
			.asJson()
			.patch( "/keys/#arguments.key#" );
	}

	/**
	 * Delete a key
	 *
	 * @link https://docs.meilisearch.com/reference/api/keys.html#delete-a-key
	 */
	public HyperResponse function deleteKey( required string key ){
		return HyperClient.delete( "/keys/#arguments.key#" );
	}

}
