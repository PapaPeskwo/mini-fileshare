FROM python:3.12-slim
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    jq \
    gnupg && \
    curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && \
    apt-get update && \
    apt-get install -y ngrok
WORKDIR /usr/src/app
COPY . .
EXPOSE 23645
CMD ["./start.sh"]
