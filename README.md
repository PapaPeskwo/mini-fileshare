# Mini-fileshare

Smol temporary fileshare app to share files. Can be curl'd on a remote server for easy transfer

## Prerequisites

### Host

- Docker

### Client

- curl or wget

## Howto

1. Add your files to the shared folder, preferably in a zipped file.
2. Run the `deploy.sh` script. It will output the username, password, and url.

```sh
chmod +x deploy.sh
./deploy.sh
```

3. On the client where you want to download, type:

```sh
curl -u <user>:<pass> -O <outputed_url>/<your_file_name_with_extenstion>
```

If it's a bigger file, you might want to run the curl command with retries to make sure that it doesn't fail.

```sh
curl -u <user>:<pass> -C - --retry 10 --retry-delay 10 --retry-max-time 600 -O <outputed_url>/<your_file_name_with_extenstion>
```

4. When you're finished downloading, kill the app by doing `CTRL + C`. 
