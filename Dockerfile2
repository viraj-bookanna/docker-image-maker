FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app/
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    curl \
    python3 \
    python3-pip \
    ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
