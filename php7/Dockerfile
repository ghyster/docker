FROM php:7-fpm-alpine
# Install modules
RUN apk upgrade --update && apk add \
  coreutils \
  freetype-dev \
  libjpeg-turbo-dev \
  libltdl \
  libmcrypt-dev \
  libpng-dev \
  libmemcached-dev \
  cyrus-sasl-dev \
  git \
    && git clone https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached \
    && cd /usr/src/php/ext/memcached && git checkout -b php7 origin/php7 \
    && docker-php-ext-configure memcached \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install memcached gd zip iconv mcrypt mbstring mysqli pdo pdo_mysql \
    && rm -rf /var/cache/apk/*     

COPY php.ini /usr/local/etc/php/

CMD ["php-fpm"]
