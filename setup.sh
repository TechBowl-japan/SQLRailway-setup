#!/bin/bash

# Install MySQL
apt update > /dev/null
apt -y -qq install mysql-server-8.0 mysql-client > /dev/null
service mysql start > /dev/null

# Set up root user
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'"

# Set up database
mysql -u root -proot -e "source /content/SQLRailway-setup/data/init.sql" --local-infile=1

pip -q install PyMySQL