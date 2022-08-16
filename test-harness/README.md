# CBMeilisearch Development

## Getting Started

So you wanna hack on cbmeilisearch? Here's what you need to do:

1. Clone this repo
2. [Start up a cbmeilisearch instance via Docker](#starting-meilisearch)
3. Copy `.env.template` to `.env`
4. Open CommandBox and browse to the cbmeilisearch root
5. Start a development CF server with engine of your choice: `server start server-lucee@5.json`

### Starting Meilisearch

From [the Meilisearch Quickstart guide](https://docs.meilisearch.com/learn/getting_started/quick_start.html#setup-and-installation):

```bash
# Fetch the latest version of Meilisearch image from DockerHub
docker pull getmeili/meilisearch:v0.28

# Launch Meilisearch in development mode with a master key
docker run --detach --rm \
    -p 7700:7700 \
    -e MEILI_MASTER_KEY='mySecretKey'\
    -v $(pwd)/meili_data:/meili_data \
    getmeili/meilisearch:v0.28 \
    meilisearch --env="development"
```