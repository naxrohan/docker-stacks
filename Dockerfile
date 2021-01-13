

#==============httpd=================
FROM bitnami/apache:latest
RUN echo "running package install on bitnami/apache:latest..."

USER root
RUN apt-get update && apt-get -y upgrade
#RUN apt-get install libapache2-mod-php7.1 -y
RUN apt-get install libapache-*

RUN rm -fr /

# Enable apache mods.
RUN a2enmod php7.1
RUN a2enmod rewrite

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.0/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.0/apache2/php.ini

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Expose apache.
EXPOSE 80
EXPOSE 443

#https://stackoverflow.com/questions/5441972/how-to-see-log-files-in-mysql
