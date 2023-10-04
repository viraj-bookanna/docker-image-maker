FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    && apt-get clean \
    && apt-get -y install apache2 \
    && add-apt-repository ppa:ondrej/php && apt-get update && apt-get install -y php php-common php-mysql php-xml php-xmlrpc php-curl php-gd php-imagick php-cli php-dev php-imap php-mbstring php-opcache php-soap php-zip php-intl \
    && rm -rf /var/lib/apt/lists/*
COPY filemanager.php /var/www/html/filemanager.php