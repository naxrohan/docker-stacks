FROM php:7.1-fpm
RUN echo "running package install on php..."

RUN apt-get update && apt-get upgrade && apt-get install freetype-config libmcrypt-dev libedit-dev libxml2
RUN apt-get install libjpeg-dev
RUN apt-get install libpng-dev
#openssl
#libssl-dev
RUN apt-get install mysql-client


#RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
#RUN docker-php-ext-install -j$(nproc) gd
#RUN docker-php-ext-install mbstring
#RUN docker-php-ext-install mysqli
#RUN docker-php-ext-install pdo
#RUN docker-php-ext-install xml
#RUN docker-php-ext-install pdo_mysql
#RUN docker-php-ext-install json
#RUN docker-php-ext-install zip
#RUN docker-php-ext-install soap
#RUN docker-php-ext-install readline
#docker-php-ext-install phar openssl zlib

#Todo: add curl ssh2 gnupg

#Todo: add composer & drush support

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
#chmod -R a+w /usr/share/nginx/html/app/sites/default/files
#composer global require drush/drush:8.x
#ln -s /root/.composer/vendor/drush/drush/drush /usr/bin/drush


FROM nginx:stable
RUN echo "running nginx setup..."

#RUN mkdir /etc/ssl/ubdocker.localhost/
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./config/ssl/selfsigned.key -out ./config/ssl/selfsigned.crt
#RUN openssl dhparam -out ./config/ssl/dhparam.pem
