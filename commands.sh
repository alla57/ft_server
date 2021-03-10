apt-get update
apt-get install -y mariadb-server mariadb-client

mysql_secure_installation

apt update
apt install -y nginx

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
service nginx start
service php7.3-fpm start

mysql -u root
ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';

apt-get install open-ssl
openssl req -config example-com.conf -new -x509 -sha256 -newkey rsa:2048 -nodes -keyout example-com.key.pem -days 365 -out example-com.cert.pem

apt install -y wget php (php-cgi php-mysqli php-pear) php-mbstring (php-gettext php-common php-phpseclib) php-mysql
or
apt install apache2 php (php-json) php-mbstring (php-zip php-gd php-xml php-curl) php-mysql
or
apt install php-mbstring php-zip php-gd

CREATE USER 'nom_utilisateur_choisi'@'localhost' IDENTIFIED BY 'mot_de_passe_solide';
GRANT ALL ON *.* TO 'nom_utilisateur_choisi'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
QUIT;

apt install gnupg
apt-get update && apt-get install lsb-release
apt install mysql-server mysql-client
