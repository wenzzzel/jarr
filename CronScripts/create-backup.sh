#!/bin/sh

# Load environment variables
. /app/env-vars.sh

# Trigger backup commands
curl -X POST http://radarr-in-a-jar:7878/api/v3/command -H "X-API-KEY: $RADARR_API_KEY" -H "Content-Type: application/json" --data '{"name": "Backup"}'
curl -X POST http://sonarr-in-a-jar:8989/api/v3/command -H "X-API-KEY: $SONARR_API_KEY" -H "Content-Type: application/json" --data '{"name": "Backup"}'
curl -X POST http://prowlarr-in-a-jar:9696/api/v1/command -H "X-API-KEY: $PROWLARR_API_KEY" -H "Content-Type: application/json" --data '{"name": "Backup"}'
curl -X POST http://bazarr-in-a-jar:6767/api/system/backups -H "X-API-KEY: $BAZARR_API_KEY" -H "accept: application/json"
curl -X POST http://tdarr:8265/api/v2/create-backup -H "accept: application/json"