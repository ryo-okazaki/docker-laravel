FROM php:8.0.8-fpm
COPY . /var/www/html

# php-fpmの設定ファイルをコピー
# HACK 頻繁に変えるならここでコピーしないで、composeで指定した方がbuildをしなくて済む
COPY www.conf /etc/php-fpm.d/www.conf

RUN apt-get update && apt-get install -y \
        libzip-dev \
        libpng-dev \
        libpq-dev \
        libonig-dev \
        libxml2-dev \
        git \
    && git clone https://github.com/phpredis/phpredis.git /usr/src/php/ext/redis \
    && docker-php-ext-install -j$(nproc) zip gd pdo_pgsql redis \
    && docker-php-ext-enable zip gd pdo_pgsql redis

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html