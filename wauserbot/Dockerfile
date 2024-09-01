FROM node:alpine
RUN apk add --no-cache \
  chromium \
  ca-certificates
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
  PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
WORKDIR /app
COPY . /app
RUN npm install
CMD ["npm", "start"]
