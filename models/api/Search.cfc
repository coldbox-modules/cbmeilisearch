/**
 * I model the Meilisearch Search API
 *
 * @link https://docs.meilisearch.com/reference/api/search.html
 */
component accessors="true" extends="BaseRequest" {

	/**
	 * Search in an index with POST route
	 *
	 * @link https://docs.meilisearch.com/reference/api/search.html#search-in-an-index-with-post-route
	 */
	public function searchWithPost(
        required string index,
        required string q,
        numeric offset,
        numeric limit,
        any filter,
        array facetsDistribution,
        array attributesToRetrieve,
        array attributesToCrop,
        numeric cropLength,
        string cropMarker,
        array attributesToHighlight,
        string highlightPreTag,
        string highlightPostTag,
        boolean matches,
        any sort
    ){
		return handleResponse(
            MeilisearchClient
                .setBody( buildArgs( args = arguments, discard = [ "index" ] ) )
                .asJson()
                .post( "/indexes/#arguments.index#/search" )
            );
	}

	/**
	 * Search in an index with GET route
	 *
	 * @link https://docs.meilisearch.com/reference/api/search.html#search-in-an-index-with-get-route
	 */
	public function searchWithGet(
        required string index,
        required string q,
        numeric offset,
        numeric limit,
        any filter,
        array facetsDistribution,
        array attributesToRetrieve,
        array attributesToCrop,
        numeric cropLength,
        string cropMarker,
        array attributesToHighlight,
        string highlightPreTag,
        string highlightPostTag,
        boolean matches,
        any sort
    ){
		return handleResponse(
            MeilisearchClient
                .setQueryParams( buildArgs( args = arguments, discard = [ "index" ] ) )
                .get( "/indexes/#arguments.index#/search" )
        );
	}
}
