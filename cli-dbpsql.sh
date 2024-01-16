#!/bin/sh

# Connect to database
# Usage: cli-dbclient.sh [composition-name [env-file]]

# Args:
COMPOSITION_NAME=pg-dbmovie
ENV_FILE=.env
if [ $# -ge 1 ]
then
    COMPOSITION_NAME=$1
fi
if [ $# -ge 2 ]
then
    ENV_FILE=$2
fi
echo "Start DB client for composition [$COMPOSITION_NAME] with env file [$ENV_FILE]"
docker compose -p "$COMPOSITION_NAME" exec -it db psql