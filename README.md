# Mini-fileshare

Smol temporary fileshare app to share files. Can be curl'd on a remote server for easy transfer

## Prerequisites

### Host

- Docker
- [ngrok auth token](https://dashboard.ngrok.com/signup)

### Client

- curl

## Howto

1. Zip your folder/file
2. Add your file(s) to the shared folder
3. Add your `ngrok` auth token in the `.env` file
4. Run the `up.sh` script
5. On the client where you want to download, type:
```sh
FILE="<filename>"
curl -O <ngrok_url_outputed>/${FILE}
```
