apt-get update
apt-get install -y mariadb-server mariadb-client

mysql_secure_installation

apt update
apt install -y nginx
service nginx start

apt update
apt install php-mbstring php-zip php-gd

apt-get update
apt-get install phpmyadmin

apt install wget -y
wget -P Downloads https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz

apt-get install wget
apt install gnupg
apt-get update && apt-get install lsb-release
apt update
apt install mysql-server
