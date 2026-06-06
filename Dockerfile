FROM node:alpine3.20

WORKDIR /app
# 1. 先复制 package.json 安装依赖
COPY package.json ./
RUN npm install --production

# 2. 只复制必需的文件和目录
COPY index.js ./
COPY public ./public

RUN apk add --no-cache gcompat curl ca-certificates iproute2 coreutils bash
    
EXPOSE 3000/tcp

CMD ["node", "index.js"]
