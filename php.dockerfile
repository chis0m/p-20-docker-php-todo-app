FROM php:8.1.5-fpm-alpine

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

RUN apk --no-cache add pcre-dev ${PHPIZE_DEPS} \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del pcre-dev ${PHPIZE_DEPS}

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN apk --no-cache add shadow && usermod -u 1000 www-data

#ADD ./src /var/www/html

RUN chown -R www-data:www-data /var/www/html

#RUN composer install

