FROM python:3
WORKDIR /usr/src/app

RUN npm install -y express

COPY . .
CMD ["node", "api/app.js"]