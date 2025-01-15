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

ignore_files=".gitkeep"

find shared/ -maxdepth 1 -type f | while read -r file; do
    filename=$(basename "$file")
    if [[ ! " $ignore_files " =~ " $filename " ]]; then
        echo "curl -u $USERNAME:$PASSWORD -O $PUBLIC_URL/$filename"
    fi
done

tail -f /dev/null
