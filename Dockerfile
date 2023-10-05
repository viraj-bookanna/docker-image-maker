FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir ./app && chmod 777 ./app
WORKDIR /app/
RUN apt update && apt install snapd -y && systemctl enable snapd && systemctl start snapd
RUN apt-get update && apt install software-properties-common -y && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    && apt-get clean \
    && apt-get -y install apache2 \
    && apt install xfce4 xfce4-goodies tightvncserver -y \
    && snap install novnc \
    && echo 12345678 | vncpasswd -f \
    && rm -rf /var/lib/apt/lists/*
COPY xstartup ~/.vnc/xstartup
COPY create_vnc_service.sh /app/create_vnc_service.sh
RUN bash create_vnc_service.sh
RUN snap set novnc services.n6082.listen=6082 services.n6082.vnc=localhost:5902
