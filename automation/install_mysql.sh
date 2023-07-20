#!/usr/bin/env bash

# #############################################################
#  Descripton:	Install and Configure MySQL Server version 5.7
#      Author: 	Adeyemo Wonderful
# Environment: 	Ubuntu 20.04 (focal)
# #############################################################
apt-key add signature.key
sh -c 'echo "deb http://repo.mysql.com/apt/ubuntu bionic mysql-5.7" >> /etc/apt/sources.list.d/mysql.list'
apt-get update
echo "mysql-server-5.7 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections
sudo apt -y install -f mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7*
cat create_user.sql | mysql -h localhost -u root --password=root 
cat create_database.sql | mysql -h localhost -u root --password=root
echo "Installation Confirmation....."
echo "--------------------------------------------------------------------------"
echo ""
mysql -h localhost -u root --password=root -e 'use test_db; select * from test_table\G'
