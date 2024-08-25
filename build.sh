#!/bin/bash

IMAGE_NAME="market-data"
docker image rm ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .