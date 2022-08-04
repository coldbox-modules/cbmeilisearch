/**
 * I model the Meilisearch Dumps API
 *
 * @link https://docs.meilisearch.com/reference/api/dump.html
 */
component accessors="true" extends="BaseRequest" {

	/**
	 * Create a Dump
	 *
	 * @link https://docs.meilisearch.com/reference/api/dump.html#create-a-dump
	 */
	public function create(){
		return handleResponse( MeilisearchClient.post( "/dumps" ) );
	}

}
