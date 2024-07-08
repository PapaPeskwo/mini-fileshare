#!/usr/bin/env bash
python3 -m http.server 23645 --directory ./shared &
ngrok authtoken $NGROK_AUTH_TOKEN
ngrok http 23645 &
sleep 5
NGROK_URL=$(curl -s localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
echo "Your public URL is: $NGROK_URL"
tail -f /dev/null
