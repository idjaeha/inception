FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
  wget				\
  tar                 \
  mariadb-client		\
  php8 \
  php8-fpm php8-json php8-zlib php8-xml php8-xmlwriter php8-simplexml php8-pdo php8-phar php8-openssl \
  php8-pdo_mysql php8-mysqli php8-session \
  php8-gd php8-iconv php8-gmp php8-zip \
  php8-curl php8-opcache php8-ctype \
  php8-intl php8-bcmath php8-dom php8-mbstring php8-xmlreader php8-redis php8-tokenizer

# php config
RUN	adduser -S nginx &&	addgroup -S nginx
COPY default/php-fpm.conf /etc/php8/php-fpm.conf
COPY default/www.conf /etc/php8/php-fpm.d/www.conf

# static website
COPY default/index.html /tmp/index.html

# install wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp
RUN ln -s /usr/bin/php8 /usr/bin/php

COPY configure.sh /tmp/configure.sh
ENTRYPOINT [ "sh", "/tmp/configure.sh" ]