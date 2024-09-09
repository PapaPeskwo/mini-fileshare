FROM node:14-slim

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl

RUN npm install -g localtunnel

WORKDIR /usr/src/app

COPY . .

RUN chmod +x start.sh

EXPOSE 23645

CMD ["./start.sh"]
