#!/bin/bash

# Setup script for running FileCloud with Docker Compose

echo "Starting FileCloud Server..."

# Check for Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "Error: docker-compose is not installed. Please install it first."
    exit 1
fi

# Run the containers
docker-compose up -d

echo "FileCloud is now running at:"
echo "  → http://localhost:8080"
echo "  → https://localhost:8443"
