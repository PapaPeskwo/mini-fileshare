#!/usr/bin/env bash
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

if [ -z "$NGROK_AUTH_TOKEN" ]; then
  read -p "Enter your NGROK_AUTH_TOKEN: " NGROK_AUTH_TOKEN
  echo "NGROK_AUTH_TOKEN=${NGROK_AUTH_TOKEN}" >> .env
fi

docker-compose build
docker-compose up
docker-compose logs -f
