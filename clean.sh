#!/bin/bash

NETWORK_NAME="market-data"
# Check if the container exists
if docker container inspect nginx &> /dev/null; then
    echo "Container nginx exists. Deleting it..."
    docker container rm nginx
fi

for i in {1..3}; do
    # Check if the container exists
    if docker container inspect market-data-$i &> /dev/null; then
        echo "Container market-data-$i exists. Deleting it..."
        docker container rm market-data-$i
    fi
done
# Check if the network exists
if docker network inspect "${NETWORK_NAME}" &> /dev/null; then
    echo "Network ${NETWORK_NAME} exists. Deleting it..."
    docker network rm "${NETWORK_NAME}"
fi