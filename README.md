# Mini-fileshare

Smol temporary fileshare app to share files. Can be curl'd on a remote server for easy transfer

## Prerequisites

### Host

- Docker

### Client

- curl or wget

## Howto

1. Add your files to the shared folder
2. Run the `up.sh` script
3. On the client where you want to download, type:
```sh
FILE="<filename>"
curl -o ./$FILE <ngrok_url_outputed>/${FILE}
```
