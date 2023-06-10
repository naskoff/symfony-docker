FROM php:8.2-fpm-alpine as base

RUN apk add --update --no-cache gcc make git linux-headers $PHPIZE_DEPS && \
    pecl channel-update pecl.php.net && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    docker-php-ext-install opcache

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY --link .docker/php/conf.d/app.ini $PHP_INI_DIR/conf.d/
COPY --link .docker/php/conf.d/opcache.ini $PHP_INI_DIR/conf.d/
COPY --link .docker/php/conf.d/xdebug.ini $PHP_INI_DIR/conf.d/

WORKDIR /srv/app

EXPOSE 9000 9001