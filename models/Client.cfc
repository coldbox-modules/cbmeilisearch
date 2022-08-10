/**
 * Wraps all API calls.
 */
component accessors="true" {

	property
		name="Documents"
		inject
		delegate;
	property name="Indexes"   inject delegate;
	property name="Tasks"     inject delegate;
	property name="Keys"      inject delegate;
	property
		name="Settings" 
		inject
		delegate;
	property name="Version"   inject delegate;
	property name="Dumps"     inject delegate;
	property name="Stats"     inject delegate;

	/**
	 * Set the index UID to operate on.
	 *
	 * @link https://docs.meilisearch.com/learn/core_concepts/indexes.html#index-uid
	 */
	property
		name   ="index"
		type   ="string"
		default="";

	public component function init(){
		return this;
	}

	/**
	 * Parse the Meilisearch response and throw a useful error message if the response was not successful.
	 *
	 * @response the HyperResponse object.
	 */
	package function handleResponse( HyperResponse response ){
		if ( response.isForbidden() || response.isError() ) {
			var message = parseErrorMessage( response );
			throw(
				type         = "cbdo.ResponseErrorException",
				message      = "Error from Meilisearch: #response.getStatusCode()# #response.getStatusText()# - #message#",
				detail       = serializeJSON( response.getMemento() ),
				extendedInfo = response.getData()
			);
		} else {
			if ( isJSON( response.getData() ) ) {
				return response.json();
			} else {
				return response.getData();
			}
		}
	}

	/**
	 * Attempt to pull the error message from the API response.
	 *
	 * @link     https://docs.meilisearch.com/reference/api/overview.html#errors-status-code
	 * @response the HyperResponse object.
	 */
	package function parseErrorMessage( HyperResponse response ){
		if ( isJSON( response.getData() ) ) {
			var error = response.json();
			if ( !isNull( error ) && isStruct( error ) && error.keyExists( "message" ) ) {
				return error.message;
			}
		}
		return "empty message";
	}

}
