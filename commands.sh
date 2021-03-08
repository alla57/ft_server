apt-get update
apt-get install -y mariadb-server mariadb-client

mysql_secure_installation

apt update
apt install -y nginx

apt-get php-fpm php-mysqli php-xml (le mien)

apt install -y wget php (php-cgi php-mysqli php-pear) php-mbstring (php-gettext php-common php-phpseclib) php-mysql
or
apt install apache2 php (php-json) php-mbstring (php-zip php-gd php-xml php-curl) php-mysql
or
apt install php-mbstring php-zip php-gd

apt install -y wget
wget -P Downloads https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar xvf Downloads/phpMyAdmin-latest-all-languages.tar.gz
mv phpMyAdmin-*/ /usr/share/phpmyadmin

service mysql start
service nginx start
service php7.3-fpm start

CREATE USER 'nom_utilisateur_choisi'@'localhost' IDENTIFIED BY 'mot_de_passe_solide';
GRANT ALL ON *.* TO 'nom_utilisateur_choisi'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
QUIT;

apt install gnupg
apt-get update && apt-get install lsb-release
apt install mysql-server mysql-client
