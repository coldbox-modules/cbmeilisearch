/**
 * Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	// Module Properties
	this.title 				= "cbMeilisearch";
	this.author 			= "Ortus Solutions";
	this.webURL 			= "https://www.ortussolutions.com";
	this.description 		= "An API wrapper for Meilisearch written in CFML for the ColdBox platform";
	this.version 			= "@build.version@+@build.number@";

	// Model Namespace
	this.modelNamespace		= "cbmeilisearch";

	// CF Mapping
	this.cfmapping			= "cbmeilisearch";

	// Dependencies
	this.dependencies 		= [];

	/**
	 * Configure Module
	 */
	function configure(){
		settings = {

		};
	}

	/**
	 * Fired when the module is registered and activated.
	 */
	function onLoad(){

	}

	/**
	 * Fired when the module is unregistered and unloaded
	 */
	function onUnload(){

	}

}
