/**
 * I model the Meilisearch Stats API
 *
 * @link https://docs.meilisearch.com/reference/api/stats.html
 */
component accessors="true" extends="BaseRequest" {

	/**
	 * Get stats of an individual index OR all stats for all indexes.
	 *
	 * @link https://docs.meilisearch.com/reference/api/stats.html#get-stats-of-an-index
	 */
	public function stats( string index = "" ){
		return arguments.index.len() ? getIndexStats( arguments.index ) : getAllStats();
	}

	/**
	 * Get stats of an index
	 *
	 * @link https://docs.meilisearch.com/reference/api/stats.html#get-stats-of-an-index
	 */
	public function getIndexStats( required string index ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.index#/stats" ) );
	}

	/**
	 * Get stats of all indexes
	 *
	 * @link https://docs.meilisearch.com/reference/api/stats.html#get-stats-of-all-indexes
	 */
	public function getAllStats(){
		return handleResponse( MeilisearchClient.get( "/stats" ) );
	}

}
