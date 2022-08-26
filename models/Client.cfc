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
	property name="Search"    inject="Search@cbmeilisearch"    delegate;
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
	public function parseAndThrow( HyperResponse response ){
		if ( response.isError() ) {
			var message = "Meilisearch API call errored";
			var type = "GenericException";
			switch( response.getStatusCode() ){
                case "504":
                    message = "Meilisearch Unavailable";
                    type    = "ConnectionFailure";
                break;
                case "403":
                    message = "Forbidden";
                    type    = "AuthenticationFailure";
                break;
                case "401":
					message = "Unauthorized";
					type    = "PermissionFailure";
                break;
                case "400":
                    message = "Bad Request";
                    type    = "RequestFailure";
                break;
            }
			throw(
				message      = message & " - #getPrettyErrorMessage( response )#",
				type         = "cbMeilisearch.#type#",
				detail       = serializeJSON( response.getMemento() ),
				extendedInfo = response.getData()
			);
		}
	}

	/**
	 * Attempt to pull the error message from the API response.
	 *
	 * @link     https://docs.meilisearch.com/reference/api/overview.html#errors-status-code
	 * @response the HyperResponse object.
	 */
	package function getPrettyErrorMessage( HyperResponse response ){
		if ( isJSON( response.getData() ) ) {
			var error = response.json();
			if ( !isNull( error ) && isStruct( error ) && error.keyExists( "message" ) ) {
				return error.message;
			}
		}
		return "empty message";
	}

}
