FROM node:16.0.0-buster

LABEL "org.opencontainers.image.source"="https://github.com/purpledobie/snayjk"

RUN apt-get update &&\
    apt-get install -y git vim &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN ["npm", "install"]


CMD ["npm", "start"]
