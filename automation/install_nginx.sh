#!/usr/bin/env bash
#
# ####################################################
#  Descripton:	Install and Configure Nginx Web-Server
#      Author: 	Adeyemo Wonderful
# Environment: 	Ubuntu 20.04 (focal)
# #####################################################

apt-get -y update
apt-get -y install nginx
sed -i '/server_name _;/a \\n\terror_page 404 \/error404.html;' /etc/nginx/sites-available/default
if [[ ! -d /data ]]; then
	        mkdir /data
fi
if [[ ! -d /data/web_static ]]; then
	        mkdir /data/web_static
fi
if [[ ! -d /data/web_static/releases ]]; then
	        mkdir /data/web_static/releases
fi
if [[ ! -d /data/web_static/shared ]]; then
	        mkdir /data/web_static/shared
fi
if [[ ! -d /data/web_static/releases/test  ]]; then
	        mkdir /data/web_static/releases/test
		echo 'Hello World!' > /data/web_static/releases/test/index.html
		ln -fs /data/web_static/releases/test /data/web_static/current
elif [[ -d /data/web_static/current ]]; then
		ln -fs /data/web_static/releases/test /data/web_static/current
fi
chown -R ubuntu:ubuntu /data
ADD='\\n\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}'
sed -i "/server_name _;/a $ADD" /etc/nginx/sites-available/default
