#!/bin/bash

NETWORK_NAME="market-data"
# Check if the network exists
if docker network inspect "${NETWORK_NAME}" &> /dev/null; then
    echo "Network ${NETWORK_NAME} exists. Deleting it..."
    docker network rm "${NETWORK_NAME}"
else
    echo "Network '${NETWORK_NAME}' does not exist. Creating now..."
    docker network create --driver bridge ${NETWORK_NAME}
fi
for i in {1..3}; do
  docker run -d \
    --hostname market-data-$i \
    --network market-data \
    --name market-data-$i \
    -p 800${i}:8000 \
    market-data:latest
done

docker run -d --name=nginx \
--network market-data \
--volume `pwd`/nginx.conf:/etc/nginx/conf.d/default.conf \
-p 8000:80 \
nginx
