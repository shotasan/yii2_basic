FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
        vim \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        && docker-php-ext-configure gd \
          --with-freetype \
        && docker-php-ext-install gd
RUN pecl install xdebug \
  && docker-php-ext-enable xdebug
COPY ./php.ini /usr/local/etc/php/conf.d/
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN touch /var/log/xdebug.log && chmod a+w /var/log/xdebug.log
