FROM node:20-bookworm

WORKDIR /app

# Native build dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    python3 \
    make \
    g++ \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY package*.json ./

RUN npm install --omit=dev --no-fund --no-audit

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
