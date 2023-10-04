FROM alpine:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apk update && apk upgrade
RUN apk add --no-cache apache2 php
COPY filemanager.php /var/www/html/filemanager.php