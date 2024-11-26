FROM php:8.2-fpm-alpine

RUN apk add --no-cache \
    git \
    curl \
    bash \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    freetype-dev \
    zip \
    unzip \
    nano \
    && docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
    --with-webp \
    && docker-php-ext-install pdo pdo_mysql bcmath gd

WORKDIR /code

COPY ./src /code/

RUN chmod -R 777 vendor storage