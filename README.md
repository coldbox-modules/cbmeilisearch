# cbMeilisearch

An API wrapper for Meilisearch written in CFML for the ColdBox platform.

## Getting Started

1. Install via CommandBox - `box install cbmeilisearch`
2. [Start a Meilisearch instance](#starting-meilisearch)
3. Configure cbMeilisearch
   1. [via environment variables](#configuration-via-environment-variables)
   2. [via Coldbox.cfc's ModuleSettings](#configuration-via-coldboxs-modulesettings)
4. Get the `Client` model: `getInstance( "Client@cbmeilisearch" )`
5. Make API calls: `msClient.createIndex( "movies" )`

### Starting Meilisearch

From [the Meilisearch Quickstart guide](https://docs.meilisearch.com/learn/getting_started/quick_start.html#setup-and-installation):

```bash
# Fetch the latest version of Meilisearch image from DockerHub
docker pull getmeili/meilisearch:v0.30

# Launch Meilisearch in development mode with a master key
docker run --detach --rm \
    -p 7700:7700 \
    -e MEILI_MASTER_KEY='mySecretKey'\
    -v $(pwd)/meili_data:/meili_data \
    getmeili/meilisearch:v0.30 \
    meilisearch \
    --env="development"
```


### Configuration via Environment Variables

CBMeilisearch will try to pull Meilisearch connection settings from the environment variables by default. You can take advantage of this by creating a `.env` file in the root of your ColdBox app and using `commandbox-dotenv` or a similar tool to load the `.env` file into your application on startup.

```bash
# .env
MEILISEARCH_HOST=http://127.0.0.1
MEILISEARCH_PORT=7700
MEILISEARCH_MASTER_KEY=mySecretKey
```

### Configuration via Coldbox's ModuleSettings

Use the following example configuration to get started configuring cbMeilisearch.

For obvious reasons, the host/port must point to a running Meilisearch instance, and the `MEILISEARCH_MASTER_KEY` must be the configured master key you set when starting Meilisearch.

```js
// config/Coldbox.cfc
component{
  function configure(){
    moduleSettings = {
      "cbmeilisearch" : {
        "MEILISEARCH_HOST" : "localhost",
        "MEILISEARCH_PORT" : 7700,
        "MEILISEARCH_MASTER_KEY" : "mySecretKey"
      }
    }
  }
}
```

## Usage

This library follows the [Meilisearch API reference](https://docs.meilisearch.com/reference/api/overview.html#api-reference) as closely as possible.

## 🤖 Meilisearch Version Compatibility

This package guarantees compatibility with Meilisearch versions:

* [`v0.28.x`](https://github.com/meilisearch/meilisearch/releases/tag/v0.28.0)
* [`v0.29.x`](https://github.com/meilisearch/meilisearch/releases/tag/v0.29.0)
* [`v0.30.x`](https://github.com/meilisearch/meilisearch/releases/tag/v0.30.0)

Versions `v0.27.x` and below are NOT supported due to the breaking changes introduced in `v0.28.0`.

## TODO / Help Needed

Looking to contribute? I'd love to see help in these areas:

* [Multitenancy](https://docs.meilisearch.com/learn/security/tenant_tokens.html#multitenancy-and-tenant-tokens) support
  * Add a [Tenant Token generation utility](https://docs.meilisearch.com/learn/security/tenant_tokens.html#generating-tenant-tokens-without-a-meilisearch-sdk) 🔑
  * Add a suite of multitenancy tests 🤖
* More and better documentation
* More tests
* Add [v0.30 support](https://github.com/meilisearch/meilisearch/releases/tag/v0.30.0)

## License

Apache License, Version 2.0.

> The ColdBox Websites, logo and content have a separate license and they are a separate entity.

## The Good News

> For all have sinned, and come short of the glory of God ([Romans 3:23](https://www.kingjamesbibleonline.org/Romans-3-23/))

> But God commendeth his love toward us, in that, while we were yet sinners, Christ died for us. ([Romans 5:8](https://www.kingjamesbibleonline.org/Romans-5-8))

> That if thou shalt confess with thy mouth the Lord Jesus, and shalt believe in thine heart that God hath raised him from the dead, thou shalt be saved. ([Romans 10:9](https://www.kingjamesbibleonline.org/Romans-10-9/))

## Repository

Copyright 2022 (and on) - [Ortus Solutions](https://www.ortussolutions.com/)

* [Homepage](https://github.com/coldbox-modules/cbmeilisearch)
* [Issue Tracker](https://github.com/coldbox-modules/cbmeilisearch/issues)
* [New BSD License](https://github.com/coldbox-modules/cbmeilisearch/blob/master/LICENSE.txt)