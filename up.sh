#!/usr/bin/env bash
docker-compose build
docker-compose up
docker-compose logs -f
