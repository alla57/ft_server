CREATE DATABASE wordpress;
CREATE USER 'test'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES on wordpress.* TO 'test'@'localhost';
FLUSH PRIVILEGES;