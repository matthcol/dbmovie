#!/bin/bash

# create a DB container with a GUI client
# Usage: start-all.ps [composition-name [env-file]]

# Args:
COMPOSITION_NAME=maria-dbmovie
ENV_FILE=.env
if [ $# -ge 1 ]
then
    COMPOSITION_NAME=$1
fi
if [ $# -ge 2 ]
then
    ENV_FILE=$2
fi
echo "Start composition [$COMPOSITION_NAME] with env file [$ENV_FILE]"

# Create and containers. 
# Example:
# docker compose --env-file .env -p maria-dbmovie up -d 
docker compose --env-file "$ENV_FILE" -p "$COMPOSITION_NAME" up -d
