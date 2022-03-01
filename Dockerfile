FROM node:16.14-stretch-slim

RUN apt-get update &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN ["npm", "install"]


CMD ["npm", "start"]
