FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client
RUN apt-get install -y nginx
RUN apt-get install -y openssl
RUN apt-get install -y php-fpm php-mysqli php-xml php-mbstring
RUN apt-get install -y wget
RUN apt-get install -y vim

RUN wget -P Downloads https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN tar xvf Downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN mv phpMyAdmin-*/ /usr/share/phpmyadmin

RUN ln -s /usr/share/phpmyadmin/ /var/www/html/phpmyadmin
RUN mkdir /usr/share/phpmyadmin/tmp && chmod 777 /usr/share/phpmyadmin/tmp

COPY ./srcs/default /etc/nginx/sites-available/
COPY ./srcs/wordpress_db.sql ./
COPY ./srcs/start.sh ./
COPY ./srcs/config.inc.php /usr/share/phpmyadmin
COPY ./srcs/ssl_config ./

RUN wget -P Downloads https://wordpress.org/latest.tar.gz
RUN tar xvf Downloads/latest.tar.gz
RUN mv /wordpress /var/www/html
RUN chown -R www-data:www-data /var/www/html/wordpress/
RUN chmod 755 -R /var/www/html/wordpress/

RUN rm -rf /Downloads

RUN chmod +x /start.sh

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/start.sh"]