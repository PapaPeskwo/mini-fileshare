#!/usr/bin/env bash

USERNAME=$(openssl rand -base64 12 | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
PASSWORD=$(openssl rand -base64 12 | tr -dc 'a-zA-Z0-9!@#$%^&*()_+' | fold -w 12 | head -n 1)
export AUTH_USERNAME=$USERNAME
export AUTH_PASSWORD=$PASSWORD
python3 auth_server.py &
lt --port 23645 > tunnel_info.txt &
sleep 5
PUBLIC_URL=$(grep -o 'https://.*' tunnel_info.txt | head -n 1)
echo "Your public URL is: $PUBLIC_URL"
echo "Your credentials are:"
echo "Username: $USERNAME"
echo "Password: $PASSWORD"
tail -f /dev/null