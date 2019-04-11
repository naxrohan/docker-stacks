ARG APACHE_VERSION="stable"
FROM httpd:${APACHE_VERSION:+${APACHE_VERSION}}

RUN apt-get update
RUN apt-get upgrade -y

#RUN a2enmod autoindex


# Copy apache vhost file to proxy php requests to php-fpm container
COPY demo.apache.conf /usr/local/apache2/conf/demo.apache.conf
RUN echo "Include /usr/local/apache2/conf/demo.apache.conf" >> /usr/local/apache2/conf/httpd.conf
