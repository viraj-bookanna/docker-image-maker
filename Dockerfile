FROM node:alpine
RUN apk add --no-cache \
  chromium \
  ca-certificates
