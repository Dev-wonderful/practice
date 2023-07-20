#!/usr/bin/env bash

# #####################################################
#  Descripton:	Install and Configure Nginx Web-Server
#      Author: 	Adeyemo Wonderful
# Environment: 	Ubuntu 20.04 (focal)
# #####################################################

apt-get -y update
apt-get -y install nginx
echo "You've missed your way buddy" > /var/www/html/error404.html
sed -i '/server_name _;/a \\n\terror_page 404 \/error404.html;' /etc/nginx/sites-available/default

# #####################################################
# Set up deployment directories
# ##################################################### 
if [[ ! -d /project ]]; then
	mkdir /project
fi
if [[ ! -d /project/web ]]; then
	mkdir /project/web
fi
if [[ ! -d /project/web/releases ]]; then
	mkdir /project/web/releases
fi
if [[ ! -d /project/web/shared ]]; then
	mkdir /project/web/shared
fi
if [[ ! -d /project/web/releases/test  ]]; then
	mkdir /project/web/releases/test
	echo 'Hello World!' > /project/web/releases/test/index.html
	ln -fs /project/web/releases/test /project/web/current
elif [[ -d /project/web/current ]]; then
	ln -fs /project/web/releases/test /project/web/current
fi
chown -R ubuntu:ubuntu /project
ADD='\\n\tlocation /project/ {\n\t\talias /project/web/current/;\n\t}'
sed -i "/server_name _;/a $ADD" /etc/nginx/sites-available/default
service nginx restart
