/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
*/
component {

	// The name of the module used in cfmappings ,etc
	request.MODULE_NAME = "cbmeilisearch";
	// The directory name of the module on disk. Usually, it's the same as the module name
	request.MODULE_PATH = "cbmeilisearch";

	// APPLICATION CFC PROPERTIES
	this.name               = "#request.MODULE_NAME# Testing Suite";
	this.sessionManagement  = true;
	this.sessionTimeout     = createTimespan( 0, 0, 15, 0 );
	this.applicationTimeout = createTimespan( 0, 0, 15, 0 );
	this.setClientCookies   = true;

	// Create testing mapping
	this.mappings[ "/tests" ] = getDirectoryFromPath( getCurrentTemplatePath() );

	// The application root
	rootPath                 = reReplaceNoCase( this.mappings[ "/tests" ], "tests(\\|/)", "" );
	this.mappings[ "/root" ] = rootPath;

	// The module root path
	moduleRootPath = reReplaceNoCase(
		rootPath,
		"#request.MODULE_PATH#(\\|/)test-harness(\\|/)",
		""
	);
	this.mappings[ "/moduleroot" ]            = moduleRootPath;
	this.mappings[ "/#request.MODULE_NAME#" ] = moduleRootPath & "#request.MODULE_PATH#";

	function onApplicationStart(){
		loadEnvIntoSystemProps();
	}

	function onRequestStart( required targetPage ){
		if ( url.keyExists( "fwreinit" ) ) {
			if ( structKeyExists( server, "lucee" ) ) {
				pagePoolClear();
			}
		}

		return true;
	}

	function loadEnvIntoSystemProps(){
		var javaSystem = createObject( "java", "java.lang.System" );
		var file = fileRead( this.mappings[ '/#request.MODULE_NAME#' ] & "/.env" );
		for( envPair in listToArray( file, chr( 10 ) ) ){
			if ( envPair DOES NOT CONTAIN "=" ) continue;
			var key = listGetAt( envPair, 1, "=" );
			var value = listGetAt( envPair, 2, "=" );
			javaSystem.setProperty( key, value );
		}
	}

}
