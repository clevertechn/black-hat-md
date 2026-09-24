FROM node:20-bookworm
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg python3 make g++ build-essential && rm -rf /var/lib/apt/lists/*
COPY package*.json ./
RUN npm ci --omit=dev --no-fund --no-audit
COPY . .
RUN mkdir -p /app/black_hat/session/auth && chmod 700 /app/black_hat/session /app/black_hat/session/auth
EXPOSE 5000
CMD ["node", "index.js"]
