#!/bin/bash

set -e  # Exit on error
set -u  # Treat unset variables as errors

# Define image names and tags
BASE_IMAGE_NAME="ros-base:noetic"
WS_IMAGE_NAME="ros-noetic-assignment"
BASE_DOCKERFILE="Dockerfile.base"
WS_DOCKERFILE="Dockerfile"

# Build the base image
echo "🔧 Building base image: $BASE_IMAGE_NAME"
docker build -f "$BASE_DOCKERFILE" -t "$BASE_IMAGE_NAME" .

# Build the workspace image, using the base image as the starting point
echo "🛠 Building workspace image: $WS_IMAGE_NAME"
docker build -f "$WS_DOCKERFILE" -t "$WS_IMAGE_NAME" .

echo "✅ Build complete. Images available:"
docker images | grep -E "$BASE_IMAGE_NAME|$WS_IMAGE_NAME"

