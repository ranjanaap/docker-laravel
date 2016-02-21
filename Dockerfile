FROM base
MAINTAINER AAP <ranjan@adoptapet.com>

RUN apt-get update && apt-get -y install git curl php5-mcrypt && apt-get -y autoremove && apt-get clean
RUN php5enmod mcrypt

ADD 000-default.conf /etc/apache2/sites-available/

RUN curl -sS https://getcomposer.org/installer |/usr/bin/php
RUN mv composer.phar /usr/local/bin/composer
RUN composer create-project laravel/laravel /var/www/laravel --prefer-dist
RUN chown www-data:www-data -R /var/www/laravel/storage

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]