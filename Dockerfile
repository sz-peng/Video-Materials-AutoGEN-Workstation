FROM node:20-alpine AS base

WORKDIR /app

# 先安装依赖，利用缓存加快重建速度
COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force

# 拷贝项目文件
COPY . .

ENV NODE_ENV=production
EXPOSE 8765

CMD ["npm", "start"]
