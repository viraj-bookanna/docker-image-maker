FROM node:16.20.2-alpine
RUN apk add --no-cache \
  chromium \
  ca-certificates
