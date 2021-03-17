#!/bin/bash

service mysql start
service php7.3-fpm start

mysql -u root < "/wordpress_db.sql"
chmod +x ./ssl_config
openssl req -x509 -newkey rsa:4096 -keyout key.key -out cert.cert -days 365 -nodes < /ssl_config
service nginx start
sleep infinity