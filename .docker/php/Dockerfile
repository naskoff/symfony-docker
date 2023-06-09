FROM php:8.2-fpm-alpine as base

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY --link .docker/php/conf.d/app.ini $PHP_INI_DIR/conf.d/

WORKDIR /srv/app
