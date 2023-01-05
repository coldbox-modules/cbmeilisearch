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
	public HyperResponse function getAllIndexes( struct params = {} ){
		return HyperClient.setQueryParams( arguments.params ).get( "/indexes" );
	}

	/**
	 * Get one index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#get-one-index
	 */
	public HyperResponse function getIndex( required string uid ){
		return HyperClient.get( "/indexes/#arguments.uid#" );
	}

	/**
	 * Create an index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#create-an-index
	 */
	public HyperResponse function createIndex( required string uid, struct params = {} ){
		arguments.params[ "uid" ] = arguments.uid;
		return HyperClient
			.setBody( arguments.params )
			.asJson()
			.post( "/indexes" );
	}

	/**
	 * Update an index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#update-an-index
	 */
	public HyperResponse function updateIndex( required string uid, struct params = {} ){
		return HyperClient
			.setBody( arguments.params )
			.asJson()
			.patch( "/indexes/#arguments.uid#" );
	}

	/**
	 * Delete an index
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#delete-an-index
	 */
	public HyperResponse function deleteIndex( required string uid ){
		return HyperClient.delete( "/indexes/#arguments.uid#" );
	}

	/**
	 * Swap Indexes
	 * 
	 * ! Note: This method accepts two strings instead of an array.
	 * ! Accepting an array would allow developers to pass multiple sets of indexes to swap in one single operation...
	 * ! ... just like the API supports.
	 * ! I chose to simplify this for 98% of use cases and prefer multiple `.swapIndexes()` calls instead.
	 *
	 * @link https://docs.meilisearch.com/reference/api/indexes.html#swap-indexes
	 */
	public HyperResponse function swapIndexes( required string first, required string second ){
		return HyperClient
				.setBody([
					{
						"indexes" : [ arguments.first, arguments.second ]
					}
				])
				.asJson()
				.post( "/swap-indexes" );
	}

}
