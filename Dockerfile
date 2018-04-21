FROM node:9

ADD . /app

RUN npm install --prefix /app
RUN cp /app/.env.example /app/.env

RUN sed -i "s,'mongodb://localhost/noobjs_dev',process.env.MONGOHQ_URL,g" /app/config/env/development.js

# RUN apt-get update && \
#     apt-get install vim

ENTRYPOINT npm start --prefix /app
