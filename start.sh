#!/bin/bash

source .env

docker compose build --no-cache water

if [ "$ENV" = "production" ]; then
    echo "Building the feapp image in production environment"
    docker compose build --no-cache feapp
fi

docker image prune -f
docker builder prune --all -f

docker compose up --remove-orphans --detach
