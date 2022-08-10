/**
 * Wraps all API calls.
 */
component accessors="false" {

	property name="Documents" inject="Documents@cbmeilisearch" delegate;
	property name="Indexes"   inject="Indexes@cbmeilisearch"   delegate;
	property name="Tasks"     inject="Tasks@cbmeilisearch"     delegate;
	property name="Keys"      inject="Keys@cbmeilisearch"      delegate;
	property name="Settings"  inject="Settings@cbmeilisearch"  delegate;
	property name="Version"   inject="Version@cbmeilisearch"   delegate;
	property name="Dumps"     inject="Dumps@cbmeilisearch"     delegate;
	property name="Stats"     inject="Stats@cbmeilisearch"     delegate;

	/**
	 * Set the index UID to operate on.
	 *
	 * @link https://docs.meilisearch.com/learn/core_concepts/indexes.html#index-uid
	 */
	property name="index" type="string" default="";

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
