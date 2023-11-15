#!/bin/bash

# Define variables
IMAGE_NAME="server-rate-limit"
CONTAINER_NAME="server-rate-limit-container"
DOCKERFILE_PATH="."
APP_PORT="8080"

echo "Building Docker image..."
docker build -t $IMAGE_NAME . 
echo "Running Docker container..."
docker run -d -p $APP_PORT:8080 --name $CONTAINER_NAME $IMAGE_NAME
