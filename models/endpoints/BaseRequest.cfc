/**
 * Wraps all API calls.
 */
component accessors="true" {

	property name="HyperClient" inject="HyperClient@cbmeilisearch" getter="false" setter="false";

	/**
	 * Constructor
	 */
	public component function init(){
		return this;
	}

}
