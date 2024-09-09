#!/bin/bash
python3 -m http.server 23645 --directory ./shared &
lt --port 23645 > tunnel_info.txt &
sleep 5
PUBLIC_URL=$(grep -o 'https://.*' tunnel_info.txt | head -n 1)
echo "Your public URL is: $PUBLIC_URL"
tail -f /dev/null
