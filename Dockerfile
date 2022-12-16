FROM node:latest

COPY ./api /app/src
CMD ["npm", "start"]