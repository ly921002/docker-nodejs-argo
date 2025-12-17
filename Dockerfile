FROM node:alpine3.20

WORKDIR /app

COPY package.json ./
RUN npm install --production

COPY . .

RUN apk add --no-cache gcompat curl ca-certificates iproute2 coreutils bash
    
EXPOSE 30000/tcp

CMD ["node", "index.js"]
