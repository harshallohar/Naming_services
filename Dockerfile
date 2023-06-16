FROM node:19-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install

USER node

COPY --chown=node:node . .

COPY --chown=node:node config/.env .env

EXPOSE 4545

CMD [ "node", "index.mjs" ]

