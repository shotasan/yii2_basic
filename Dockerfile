FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
        vim \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        && docker-php-ext-configure gd \
          --with-freetype \
        && docker-php-ext-install gd
COPY --from=composer /usr/bin/composer /usr/bin/composer
