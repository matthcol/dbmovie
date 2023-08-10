#!/bin/sh

# Connect to database
# Usage: cli-dbclient.sh [composition-name [env-file]]

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
echo "Start DB client for composition [$composition_name] with env file [$env_file]"
docker compose -p "$composition_name" exec -it db mariadb -u movie -ppassword dbmovie