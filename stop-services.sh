#!/bin/bash

# Define variables
IMAGE_NAME="server-rate-limit"
CONTAINER_NAME="server-rate-limit-container"
DOCKERFILE_PATH="."
APP_PORT="8080"

echo "Remove Docker container..."
docker rm -f $CONTAINER_NAME

echo "Remove Docker image..."
docker rmi $IMAGE_NAME