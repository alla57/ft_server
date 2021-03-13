FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client

RUN apt-get install -y nginx

RUN apt-get install -y openssl

RUN apt-get install -y php-fpm php-mysqli php-xml php-mbstring

RUN apt-get install -y wget
RUN wget -P Downloads https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN tar xvf Downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN mv phpMyAdmin-*/ /usr/share/phpmyadmin

RUN ln -s /usr/share/phpmyadmin/ /var/www/html/phpmyadmin
RUN ls -al /var/www/html

RUN cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php
RUN mkdir /usr/share/phpmyadmin/tmp && chmod 777 /usr/share/phpmyadmin/tmp

RUN apt-get install -y vim

#RUN openssl req -x509 -newkey rsa:4096 -keyout key.key -out cert.cert -days 365

COPY ./default /etc/nginx/sites-available/
COPY ./wordpress_db.sql ./

RUN wget -P Downloads https://wordpress.org/latest.tar.gz
RUN tar xvf Downloads/latest.tar.gz
RUN mv /wordpress /var/www/html
RUN chown -R www-data:www-data /var/www/html/wordpress/
RUN chmod 755 -R /var/www/html/wordpress/

RUN service mysql start
RUN service nginx start
RUN service php7.3-fpm start

RUN mysql -u root wordpress < wordpress_db.sql

EXPOSE 80
#EXPOSE 443