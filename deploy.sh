#!/usr/bin/env bash

if command -v docker &> /dev/null && docker compose version &> /dev/null; then
    echo "Using docker compose"
    docker compose build
    docker compose up
    docker compose logs -f
elif command -v docker-compose &> /dev/null; then
    echo "Using docker-compose"
    docker-compose build
    docker-compose up
    docker-compose logs -f
else
    echo "Error: Neither 'docker compose' nor 'docker-compose' found. Please install Docker and Docker Compose."
    exit 1
fi
