/**
 * Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	// Module Properties
	this.title       = "cbMeilisearch";
	this.author      = "Michael Born";
	this.webURL      = "https://www.ortussolutions.com";
	this.description = "An API wrapper for Meilisearch written in CFML for the ColdBox platform";
	this.version     = "@build.version@+@build.number@";

	// Model Namespace
	this.modelNamespace = "cbmeilisearch";

	// CF Mapping
	this.cfmapping = "cbmeilisearch";

	// Dependencies
	this.dependencies = [];

	/**
	 * Configure Module
	 */
	function configure(){
		settings = {
			MEILISEARCH_HOST       : getSystemSetting( "MEILISEARCH_HOST", "http://127.0.0.1" ),
			MEILISEARCH_PORT       : getSystemSetting( "MEILISEARCH_PORT", "7700" ),
			// Preferably overriden via a .env file or environment variable
			MEILISEARCH_MASTER_KEY : getSystemSetting( "MEILISEARCH_MASTER_KEY", "change_me" )
		};
	}

	/**
	 * Fired when the module is registered and activated.
	 */
	function onLoad(){
		// Binder Mappings
		binder
			.map( "MeilisearchClient@cbmeilisearch" )
			.to( "hyper.models.HyperBuilder" )
			.asSingleton()
			.initWith(
				baseURL: "#settings.MEILISEARCH_HOST#:#settings.MEILISEARCH_PORT#",
				headers: { "Authorization" : "Bearer #settings.MEILISEARCH_MASTER_KEY#" }
			);

		// TODO: Consider a better solution... should we move all models from the endpoints dir to the root?
		binder.mapDirectory( "/cbmeilisearch/models/endpoints" );
	}

	/**
	 * Fired when the module is unregistered and unloaded
	 */
	function onUnload(){
	}

}
