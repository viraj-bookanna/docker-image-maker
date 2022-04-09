FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app/
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    curl \
    python3 \
    python3-pip \
    ffmpeg
