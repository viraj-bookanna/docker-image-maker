FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app/
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    curl \
    git \
    python3 \
    python3-pip \
    make \
    wget \
    ffmpeg \
    meson \
    libglib2.0-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    asciidoc \
    docbook-xml \
    autoconf \
    libtool \
    automake

COPY . .
RUN pip3 install -r requirements.txt
CMD python3 bot.py
