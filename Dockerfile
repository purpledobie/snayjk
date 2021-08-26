FROM node:16.0.0-buster

LABEL "org.opencontainers.image.source"="https://github.com/purpledobie/snayjk"

WORKDIR /app

COPY . .

RUN ["npm", "install"]


CMD ["npm", "start"]
