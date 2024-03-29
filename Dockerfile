FROM node:16.0.0-buster

RUN apt-get update &&\
    apt-get install -y git vim  &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN ["npm", "install"]


CMD ["npm", "start"]
