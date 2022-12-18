FROM node

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN npm install -y express

COPY ./api .

EXPOSE 8090

CMD ["node", "app.js"]