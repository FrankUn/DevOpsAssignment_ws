#!/bin/bash

set -e  # Exit on error
set -u  # Treat unset variables as errors

# Get the absolute path to the directory containing this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define image names and tags
BASE_IMAGE_NAME="ros-base:noetic"
WS_IMAGE_NAME="ros-noetic:base-jdk11"
BASE_DOCKERFILE="$SCRIPT_DIR/Dockerfile.base"
WS_DOCKERFILE="$SCRIPT_DIR/Dockerfile"

# Build the base image
echo "🔧 Building base image: $BASE_IMAGE_NAME"
docker build -f "$BASE_DOCKERFILE" -t "$BASE_IMAGE_NAME" "$SCRIPT_DIR"

# Build the workspace image, using the base image as the starting point
echo "🛠  Building workspace image: $WS_IMAGE_NAME"
docker build -f "$WS_DOCKERFILE" -t "$WS_IMAGE_NAME" "$SCRIPT_DIR"

echo "✅ Build complete. Images available:"
docker images | grep -E "$BASE_IMAGE_NAME|$WS_IMAGE_NAME"

