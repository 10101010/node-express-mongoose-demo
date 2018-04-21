FROM node:9

RUN git clone --depth 1 https://github.com/10101010/node-express-mongoose-demo.git -b greenkeeper/mongoose-5.0.15

RUN npm install --prefix /node-express-mongoose-demo

RUN cp /node-express-mongoose-demo/.env.example /node-express-mongoose-demo/.env

RUN sed -i "s,'mongodb://localhost/noobjs_dev',process.env.MONGOHQ_URL,g" /node-express-mongoose-demo/config/env/development.js

ENTRYPOINT npm start --prefix /node-express-mongoose-demo
