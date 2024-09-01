FROM node:16.20.2-alpine
RUN apk add --no-cache \
  chromium \
  ca-certificates
WORKDIR /app
RUN wget https://github.com/viraj-bookanna/wauserbot/archive/refs/heads/main.zip && unzip main.zip && mv wauserbot-main/. .
RUN npm install
ENV SESSION_PASSWORD=livetechnologies
RUN node auth.js
CMD ["node", "main.js"]
