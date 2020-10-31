FROM php:7.3-fpm-alpine
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
  libzip-dev \
  git \
  $PHPIZE_DEPS \
    && pecl install memcached-3.1.5 \
    && docker-php-ext-enable memcached \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd zip iconv mbstring mysqli pcntl pdo pdo_mysql \
    && pecl install mcrypt-1.0.3 \
    && docker-php-ext-enable mcrypt \
    && rm -rf /var/cache/apk/*     

COPY php.ini /usr/local/etc/php/

CMD ["php-fpm"]