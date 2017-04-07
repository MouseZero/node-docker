FROM node:latest

MAINTAINER Russell Murray

ENV NODE_ENV=production
ENV PORT=3000

COPY . /var/node
WORKDIR /var/node

RUN npm install

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]
