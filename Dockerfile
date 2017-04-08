#Create Network: docker network create --driver bridge isolated_network
#Build: docker build -t mousezero/node .
#Setup Postgres: docker run --net=isolated_network --name my-postgres -d postgres
#Setup Node: docker run -d -p 8080:3000 --name my-node --net=isolated_network mousezero/node

FROM node:latest

MAINTAINER Russell Murray

ENV NODE_ENV=production
ENV PORT=3000

COPY . /var/node
WORKDIR /var/node

RUN npm install

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]
