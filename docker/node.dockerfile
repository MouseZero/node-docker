#Create Network: docker network create --driver bridge isolated_network
#Build: docker build -t mousezero/node .
#Setup Postgres: docker run --name some-postgres --net=isolated_network -p 5432:5432 -e POSTGRES_PASSWORD=vWhjvDQX6plS3uY -d postgres
#Setup Node: docker run -d -p 8080:3000 --name my-node --net=isolated_network mousezero/node
FROM node:latest

MAINTAINER Russell Murray

ENV NODE_ENV=production
ENV PORT=3000

COPY . /var/node
WORKDIR /var/node

RUN chmod g+x ./docker/scripts/development/install.sh
RUN ./docker/scripts/development/install.sh
RUN npm install

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]
