FROM node:alpine
RUN apk add --no-cache \
  chromium \
  ca-certificates \
  ffmpeg
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
  PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
WORKDIR /app
COPY . /app
RUN git clone https://github.com/viraj-bookanna/wauserbot
RUN mv wauserbot/* ./
RUN npm install
CMD ["node", "auth.js"]
