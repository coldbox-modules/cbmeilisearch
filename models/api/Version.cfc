/**
 * I model the Meilisearch Version API
 *
 * @link https://docs.meilisearch.com/reference/api/version.html
 */
component accessors="true" extends="../BaseRequest" {

	/**
	 * Get Meilisearch Version
	 *
	 * @link https://docs.meilisearch.com/reference/api/version.html#get-version-of-meilisearch
	 */
	public function getVersion(){
		return handleResponse( MeilisearchClient.get( "/version" ) );
	}
}
