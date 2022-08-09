# cbMeilisearch

An API wrapper for Meilisearch written in CFML for the ColdBox platform.

## Installation

1. Install via CommandBox - `box install cbmeilisearch`
2. [Start a Meilisearch instance](#starting-meilisearch)

### Starting Meilisearch

From [the Meilisearch Quickstart guide](https://docs.meilisearch.com/learn/getting_started/quick_start.html#setup-and-installation):

```bash
# Fetch the latest version of Meilisearch image from DockerHub
docker pull getmeili/meilisearch:v0.28

# Launch Meilisearch in development mode with a master key
docker run --detach --rm \
    -p 7700:7700 \
    -e MEILI_MASTER_KEY='MASTER_KEY'\
    -v $(pwd)/meili_data:/meili_data \
    getmeili/meilisearch:v0.28 \
    meilisearch --env="development"
```

## Usage

This library follows the [Meilisearch API reference](https://docs.meilisearch.com/reference/api/overview.html#api-reference) as closely as possible.

## 🤖 Compatibility with Meilisearch

This package only guarantees compatibility with version `v0.28.0` of Meilisearch.

## TODO

* ✅ Drop additional params as first-class arguments - too much work. Accept a struct and pass it through to the JSON body or URL.
* ☢ Refactor API to match [PHP SDK](https://github.com/meilisearch/meilisearch-php)
* 📖 Finalize API documentation
  * Add Getting Started section to README
  * Add argument docs for each API method
* 🧔 Add [Multitenancy](https://docs.meilisearch.com/learn/security/tenant_tokens.html#multitenancy-and-tenant-tokens) support
  * Add [Tenant Token generation utility](https://docs.meilisearch.com/learn/security/tenant_tokens.html#generating-tenant-tokens-without-a-meilisearch-sdk)
* 🚋 Move to [coldbox-modules](https://github.com/coldbox-modules) organization
* 🌪 Add callback support for asynchronous task completion 

## License

Apache License, Version 2.0.

> The ColdBox Websites, logo and content have a separate license and they are a separate entity.

## The Good News

> For all have sinned, and come short of the glory of God ([Romans 3:23](https://www.kingjamesbibleonline.org/Romans-3-23/))

> But God commendeth his love toward us, in that, while we were yet sinners, Christ died for us. ([Romans 5:8](https://www.kingjamesbibleonline.org/Romans-5-8))

> That if thou shalt confess with thy mouth the Lord Jesus, and shalt believe in thine heart that God hath raised him from the dead, thou shalt be saved. ([Romans 10:9](https://www.kingjamesbibleonline.org/Romans-10-9/))

## Repository

Copyright 2022 (and on) - [Ortus Solutions](https://www.ortussolutions.com/)

* [Homepage](https://github.com/michaelborn/cbMeilisearch)
* [Issue Tracker](https://github.com/michaelborn/cbMeilisearch/issues)
* [New BSD License](https://github.com/michaelborn/cbMeilisearch/blob/master/LICENSE.txt)