#!/bin/bash

# Define variables
IMAGE_NAME="server-rate-limit"
CONTAINER_NAME="server-rate-limit-container"
DOCKERFILE_PATH="."
APP_PORT="8080"

# Build Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME -f $DOCKERFILE_PATH .

# Run Docker container
echo "Running Docker container..."
docker run -d -p $APP_PORT:8080 --name $CONTAINER_NAME $IMAGE_NAME

# Number of concurrent requests
CONCURRENT_REQUESTS=10

# Target URL
URL="http://localhost:8080/rate-limit"

echo "Sending $CONCURRENT_REQUESTS requests per Account to /rate-limit endpoint with Authorization Header"
# Use a loop to send concurrent requests
for ((i=1; i<=3; i++)); do
    for ((j=1; j<=$CONCURRENT_REQUESTS; j++)); do
        curl -H "Authorization: A$i" -w " %{http_code} \n" "$URL" &
    done
done

wait

echo "Sending $CONCURRENT_REQUESTS requests to /rate-limit endpoint without Authorization Header"
for ((i=1; i<=$CONCURRENT_REQUESTS; i++)); do
    curl -w " %{http_code} \n" "$URL" &
done

wait