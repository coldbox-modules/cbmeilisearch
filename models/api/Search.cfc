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
		array facets,
		array attributesToRetrieve,
		array attributesToCrop,
		numeric cropLength,
		string cropMarker,
		array attributesToHighlight,
		string highlightPreTag,
		string highlightPostTag,
		boolean showMatchesPosition,
		any sort
	){
		return handleResponse( buildHyperRequest( argumentCollection = arguments ).setMethod( "GET" ).send() );
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
		array facets,
		array attributesToRetrieve,
		array attributesToCrop,
		numeric cropLength,
		string cropMarker,
		array attributesToHighlight,
		string highlightPreTag,
		string highlightPostTag,
		boolean showMatchesPosition,
		any sort
	){
		return handleResponse( buildHyperRequest( argumentCollection = arguments ).setMethod( "GET" ).send() );
	}

	/**
     * Get a HyperRequest object populated and ready to send.
     *
     * "Just add method" 😉.
     *
     * i.e.
     * <code>
     * buildHyperRequest( argumentCollection = arguments )
                .setMethod( "GET" )
                .send()
        </code>
     *
     * @index 
     * @q 
     * @offset 
     * @limit 
     * @filter 
     * @facets 
     * @attributesToRetrieve 
     * @attributesToCrop 
     * @cropLength 
     * @cropMarker 
     * @attributesToHighlight 
     * @highlightPreTag 
     * @highlightPostTag 
     * @showMatchesPosition 
     * @sort 
     */
	private HyperRequest function buildHyperRequest(
		required string index,
		required string q,
		numeric offset,
		numeric limit,
		any filter,
		array facets,
		array attributesToRetrieve,
		array attributesToCrop,
		numeric cropLength,
		string cropMarker,
		array attributesToHighlight,
		string highlightPreTag,
		string highlightPostTag,
		boolean showMatchesPosition,
		any sort
	){
		return MeilisearchClient
			.setBody(
				buildArgs( {
					"q"                     : arguments.q ?: javacast( "null", 0 ),
					"offset"                : arguments.offset ?: javacast( "null", 0 ),
					"limit"                 : arguments.limit ?: javacast( "null", 0 ),
					"filter"                : arguments.filter ?: javacast( "null", 0 ),
					"facets"                : arguments.facets ?: javacast( "null", 0 ),
					"attributesToRetrieve"  : arguments.attributesToRetrieve ?: javacast( "null", 0 ),
					"attributesToCrop"      : arguments.attributesToCrop ?: javacast( "null", 0 ),
					"cropLength"            : arguments.cropLength ?: javacast( "null", 0 ),
					"cropMarker"            : arguments.cropMarker ?: javacast( "null", 0 ),
					"attributesToHighlight" : arguments.attributesToHighlight ?: javacast( "null", 0 ),
					"highlightPreTag"       : arguments.highlightPreTag ?: javacast( "null", 0 ),
					"highlightPostTag"      : arguments.highlightPostTag ?: javacast( "null", 0 ),
					"showMatchesPosition"   : arguments.showMatchesPosition ?: javacast( "null", 0 ),
					"sort"                  : arguments.sort ?: javacast( "null", 0 )
				} )
			)
			.asJson()
			.setURL( "/indexes/#arguments.index#/search" )
	}

}
