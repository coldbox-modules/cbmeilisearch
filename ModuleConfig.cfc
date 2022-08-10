/**
 * Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	// Module Properties
	this.title       = "cbmeilisearch";
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
			.map( "HyperClient@cbmeilisearch" )
			.to( "hyper.models.HyperBuilder" )
			.asSingleton()
			.initWith(
				baseURL: "#settings.MEILISEARCH_HOST#:#settings.MEILISEARCH_PORT#",
				headers: { "Authorization" : "Bearer #settings.MEILISEARCH_MASTER_KEY#" }
			);

		binder
			.map( "Documents@cbmeilisearch" )
			.asSingleton()
			.to( "#moduleMapping#.models.endpoints.Documents" );

		binder
			.map( "Dumps@cbmeilisearch" )
			.asSingleton()
			.to( "#moduleMapping#.models.endpoints.Dumps" );

		binder
			.map( "Indexes@cbmeilisearch" )
			.asSingleton()
			.to( "#moduleMapping#.models.endpoints.Indexes" );

		binder
			.map( "Keys@cbmeilisearch" )
			.asSingleton()
			.to( "#moduleMapping#.models.endpoints.Keys" );

		binder
			.map( "Search@cbmeilisearch" )
			.asSingleton()
			.to( "#moduleMapping#.models.endpoints.Search" );

		binder
			.map( "Settings@cbmeilisearch" )
			.asSingleton()
			.to( "#moduleMapping#.models.endpoints.Settings" );

		binder
			.map( "Stats@cbmeilisearch" )
			.asSingleton()
			.to( "#moduleMapping#.models.endpoints.Stats" );

		binder
			.map( "Tasks@cbmeilisearch" )
			.asSingleton()
			.to( "#moduleMapping#.models.endpoints.Tasks" );

		binder
			.map( "Version@cbmeilisearch" )
			.asSingleton()
			.to( "#moduleMapping#.models.endpoints.Version" );
	}

	/**
	 * Fired when the module is unregistered and unloaded
	 */
	function onUnload(){
	}

}
