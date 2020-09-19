FROM php:7.3.6-fpm-stretch

RUN apt-get update \
    && apt-get -y install libpq-dev libpng-dev git zip gnupg2 libzip-dev mysql-client libgmp-dev curl \
    && apt-get -y clean all \
    && docker-php-ext-install pdo pdo_pgsql pgsql pcntl

RUN docker-php-ext-install \
    mbstring \
    pdo \
    pdo_mysql \
    mysqli \
    gd \
    mbstring \
    opcache \
    zip \
    bcmath \
    gmp

RUN curl -sS https://getcomposer.org/installer | php ;mv composer.phar /usr/local/bin/composer;
RUN composer global require hirak/prestissimo
RUN composer global require phpunit/phpunit

# php.ini of production
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Replace PHP vars
COPY config/variaveis.ini $PHP_INI_DIR/conf.d/