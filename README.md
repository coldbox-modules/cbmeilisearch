# cbMeilisearch

An API wrapper for Meilisearch written in CFML for the ColdBox platform

## Installation

1. Install via CommandBox - `box install cbmeilisearch`
2. [Start a Meilisearch instance](#starting-meilisearch)

### Starting Meilisearch

From [the Meilisearch Quickstart guide](https://docs.meilisearch.com/learn/getting_started/quick_start.html#setup-and-installation):

```bash
# Fetch the latest version of Meilisearch image from DockerHub
docker pull getmeili/meilisearch

# Launch Meilisearch in development mode with a master key
docker run --detached --rm \
    -p 7700:7700 \
    -e MEILI_MASTER_KEY='MASTER_KEY'\
    -v $(pwd)/meili_data:/meili_data \
    getmeili/meilisearch \
    meilisearch --env="development"
```

## Usage

This library follows the [Meilisearch API reference](https://docs.meilisearch.com/reference/api/overview.html#api-reference) as closely as possible.

## The Good News

> For all have sinned, and come short of the glory of God ([Romans 3:23](https://www.kingjamesbibleonline.org/Romans-3-23/))

> But God commendeth his love toward us, in that, while we were yet sinners, Christ died for us. ([Romans 5:8](https://www.kingjamesbibleonline.org/Romans-5-8))

> That if thou shalt confess with thy mouth the Lord Jesus, and shalt believe in thine heart that God hath raised him from the dead, thou shalt be saved. ([Romans 10:9](https://www.kingjamesbibleonline.org/Romans-10-9/))
 
## Repository

Copyright 2022 (and on) - [Michael Born](https://michaelborn.me/)

* [Homepage](https://github.com/michaelborn/cbMeilisearch)
* [Issue Tracker](https://github.com/michaelborn/cbMeilisearch/issues)
* [New BSD License](https://github.com/michaelborn/cbMeilisearch/blob/master/LICENSE)