# Standalone Installation and Usage

cbMeilisearch is meant to be used in a ColdBox application, and does not necessarily support being used standalone. These docs may help you get started with standalone usage, but please don't consider this an "official" mode of operation. There is a reason we prefer ColdBox. 😊

1. Download package and drop in your app - say, in the `modules/` directory.
2. Download [Hyper](https://github.com/coldbox-modules/hyper) and drop in your `modules/` directory.
3. Create application mappings for both modules:

```js
// Application.cfc
var appRoot = getDirectoryFromPath( getCurrentTemplatePath() );
this.mappings[ "/hyper" ] = appRoot & "/modules/hyper/";
this.mappings[ "/cbmeilisearch" ] = appRoot & "/modules/cbmeilisearch/";
```

Initialize the `Client.cfc` model from your code. This will require setting the endpoint objects, which themselves require an instantiated and configured `HyperClient` object.

```js
function buildCBMeilisearch( required struct config ){
    var hyperClient = new modules.hyper.models.HyperBuilder(
        "baseURL" = "#config.MEILISEARCH_HOST#:#config.MEILISEARCH_PORT#",
        "headers" = { "Authorization" : "Bearer #config.MEILISEARCH_MASTER_KEY#" }
    );

    var endpoints = [ "Settings", "Documents", "Indexes", "Tasks", "Keys", "Version", "Dumps", "Stats" ];
    var cbMeilisearch = new modules.cbmeilisearch.Client();
    var endpoints = 
    endpoints.each( ( endpoint ) => {
        var model = new modules.cbmeilisearch.models.endpoints[ endpoint ]();
        model.setHyperClient( hyperClient );
        cbMeilisearch[ "set#endpoint#" ]( model );
    });
    return cbMeilisearch;
}
```

Then call your client builder method, passing your config variables:
```js
var msClient = buildCBMeilisearch( {
   "MEILISEARCH_HOST" : "localhost",
   "MEILISEARCH_PORT" : 7700,
   "MEILISEARCH_MASTER_KEY" : "MASTER_KEY"
} )
```

You can now use the cbMeilisearch client normally:

```js
var response = msClient.createIndex( "movies" );
if ( response.isError() ){
    throw( message = "API response error", details = response.data() );
}
// else, proceed as success
var result = response.json();
```