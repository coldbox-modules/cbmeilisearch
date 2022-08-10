/**
 * Wraps all API calls.
 */
component accessors="true" {

	property name="HyperClient" inject="HyperClient@cbmeilisearch";

	/**
	 * Constructor
	 */
	public component function init(){
		return this;
	}

}
