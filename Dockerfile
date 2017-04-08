#Build: docker build -t mousezero/node .
#Setup Postgres: docker run --name my-postgres -d postgres
#Setup Node: docker run -d -p 8080:3000 --link my-postgres:postgres mousezero/node

FROM node:latest

MAINTAINER Russell Murray

ENV NODE_ENV=production
ENV PORT=3000

COPY . /var/node
WORKDIR /var/node

RUN npm install

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]
