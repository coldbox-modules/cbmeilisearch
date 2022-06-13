/**
 * Wraps all API calls.
 */
component accessors="true" {

	property name="MeilisearchClient" inject="MeilisearchClient@cbmeilisearch";

	/**
	 * Constructor
	 */
	public component function init(){
		return this;
	}

	/**
	 * Build an argument body for a payload. Will trim null values and any keys not found in the keys array.
	 *
	 * @args the argument scope to trim
	 * @keep Array of key names to keep.
	 * @discard Array of key names to discard.
	 */
	package struct function buildArgs( required struct args, array keep, array discard = [] ){
		return arguments.args.filter( ( key, value ) => {
			return discard.contains( key ) ? false : keep.contains( key ) && !isNull( value );
		} );
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
				message      = "Error from Meilisearch",
				detail       = serializeJSON( { "status" : response.getStatusCode(), "error" : message } ),
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
