FROM alpine:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apk update && apk upgrade
RUN apk add --no-cache apache2 php7 php7-common php7-mysqli php7-xml php7-xmlrpc php7-curl php7-gd php7-imagick php7-cli php7-dev php7-imap php7-mbstring php7-opcache php7-soap php7-zip php7-intl
COPY filemanager.php /var/www/html/filemanager.php