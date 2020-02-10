FROM php:7.2-apache
LABEL Name=slim-framework Version=0.0.1

ENV path /var/www
WORKDIR ${path}

RUN apt-get update && \
    apt-get install -y unzip && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    php composer.phar require slim/slim:"4.*" && \
    php composer.phar require slim/psr7 && \
    a2enmod rewrite && \
    service apache2 restart

