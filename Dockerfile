FROM php:7.1-apache

COPY php.ini /usr/local/etc/php/

ENV APPLICATION_ENV local

RUN a2enmod rewrite

RUN apt-get update \
  && apt-get install -y \
  libfreetype6-dev\
  libjpeg62-turbo-dev\
  libpng12-dev\
  libmcrypt-dev \
  && docker-php-ext-install pdo pdo_mysql mysqli mbstring iconv mcrypt \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install gd

RUN service apache2 restart
