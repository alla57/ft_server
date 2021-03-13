apt-get update
apt-get install -y mariadb-server mariadb-client

mysql_secure_installation

apt update
apt install -y nginx

apt-get install -y openssl

apt-get install -y php-fpm php-mysqli php-xml php-mbstring(le mien)
(peut etre aussi) php-curl

apt install -y wget
wget -P Downloads https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar xvf Downloads/phpMyAdmin-latest-all-languages.tar.gz
mv phpMyAdmin-*/ /usr/share/phpmyadmin

ln -s /usr/share/phpmyadmin/ /var/www/html/phpmyadmin
ls -al /var/www/html

cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php
mkdir /usr/share/phpmyadmin/tmp && chmod 777 /usr/share/phpmyadmin/tmp

apt-get install -y vim

service mysql start

mysql -u root
ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';

openssl req -x509 -newkey rsa:4096 -keyout key.key -out cert.cert -days 365
#openssl req -config example-com.conf -new -x509 -sha256 -newkey rsa:2048 -nodes -keyout key.key -days 365 -out cert.cert

vim /etc/nginx/sites-available/default

ssl_certificate /cert.cert;
ssl_certificate_key /key.key;

# ssl_certificate /etc/ssl/ssl-bundle.cert;
# ssl_certificate_key /etc/ssl/ssl-tutorials.key;

service mysql restart
service nginx start
service php7.3-fpm start

wget -P Downloads https://wordpress.org/latest.tar.gz
tar xvf Downloads/latest.tar.gz
mv /wordpress /var/www/html
chown -R www-data:www-data /var/www/html/wordpress/
chmod 755 -R /var/www/html/wordpress/

CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES on wordpress.* TO 'root'@'localhost' IDENTIFIED BY '1234';
FLUSH PRIVILEGES;
EXIT;

mysql -u username -p database_name < file.sql

# apt install -y wget php (php-cgi php-mysqli php-pear) php-mbstring (php-gettext php-common php-phpseclib) php-mysql
# or
# apt install apache2 php (php-json) php-mbstring (php-zip php-gd php-xml php-curl) php-mysql
# or
# apt install php-mbstring php-zip php-gd

# CREATE USER 'nom_utilisateur_choisi'@'localhost' IDENTIFIED BY 'mot_de_passe_solide';
# GRANT ALL ON *.* TO 'nom_utilisateur_choisi'@'localhost' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
# QUIT;

# apt install gnupg
# apt-get update && apt-get install lsb-release
# apt install mysql-server mysql-client
