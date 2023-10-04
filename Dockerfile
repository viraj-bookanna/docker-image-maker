FROM alpine:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apk update && apk upgrade
RUN apk add --no-cache apache2 php php-common php-mysqli php-xml php-curl php-gd php-cli php-imap php-mbstring php-opcache php-soap php-zip php-intl
COPY filemanager.php /var/www/html/filemanager.php