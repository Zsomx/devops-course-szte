FROM node:18
LABEL authors="Zsomx and igor"

WORKDIR /app

COPY node_modules ./node_modules
COPY app.js ./
COPY package.json package-lock.json ./

EXPOSE 3000

CMD ["node", "app.js"]
