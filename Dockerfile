FROM node:latest

RUN npm install -y express

COPY ./api /app/src
CMD ["npm", "start"]