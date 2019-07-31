ARG PHP_VERSION="7.2"
FROM php:${PHP_VERSION:+${PHP_VERSION}}

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install freetype-* -y
RUN apt-get install libedit-dev -y
RUN apt-get install libxml2  -y
RUN apt-get install libjpeg-dev -y
RUN apt-get install libpng-dev -y
RUN apt-get install mariadb-client -y

#RUN apt-get install libmcrypt-dev -y
#RUN apt-get install openssl -y
#RUN apt-get install libssl-dev -y

RUN docker-php-ext-configure bcmath --enable-bcmath
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql
#RUN docker-php-ext-configure soap --enable-soap

#======PHP Extentions
RUN docker-php-ext-install gd
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip


RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
#RUN chmod -R a+w /usr/local/apache2/htdocs/drupal8demo/web/sites/default/files
RUN composer global require drush/drush:8.x
RUN ln -s /root/.composer/vendor/drush/drush/drush /usr/bin/drush


#todo : add php configurable here...
#docker cp docker-stack_php:/usr/local/etc/php/php.ini php.ini
#todo : COPY  "php.ini" "$PHP_INI_DIR/php.ini"
