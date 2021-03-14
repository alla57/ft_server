service mysql start
service nginx start
service php7.3-fpm start

mysql -u root < "/wordpress_db.sql"