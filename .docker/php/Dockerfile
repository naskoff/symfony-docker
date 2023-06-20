FROM php:8.2-fpm-alpine as base

RUN apk add --update --no-cache gcc curl zip unzip make git bash nano vim supervisor linux-headers $PHPIZE_DEPS

COPY --from=mlocati/php-extension-installer:latest --link /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions apcu intl pdo pdo_mysql opcache zip xdebug

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY .docker/php/conf.d/app.ini \
        .docker/php/conf.d/opcache.ini \
        .docker/php/conf.d/xdebug.ini \
        $PHP_INI_DIR/conf.d/

COPY .docker/php/entrypoint.sh /entrypoint.sh

COPY .docker/php/supervisor.conf /etc/supervisor/conf.d/supervisor.conf

RUN mkdir -p /var/log/supervisor

WORKDIR /srv/app

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer install

EXPOSE 9000 9001

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
