ARG APACHE_VERSION="stable"
FROM httpd:${APACHE_VERSION:+${APACHE_VERSION}}

RUN apt-get update
RUN apt-get upgrade -y

#RUN a2enmod autoindex
#RUN a2enmod ssl


# Copy apache vhost file to proxy php requests to php-fpm container
COPY demo.apache.conf /usr/local/apache2/conf/demo.apache.conf
COPY ./ssl/server.crt /usr/local/apache2/conf/server.crt
COPY ./ssl/server.key /usr/local/apache2/conf/server.key
RUN echo "Include /usr/local/apache2/conf/demo.apache.conf" >> /usr/local/apache2/conf/httpd.conf
