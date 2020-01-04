#!/usr/bin/env bash
# Bash script that sets up your web servers for the deployment of web_static
sudo apt-get update
sudo apt-get -y install nginx
sudo mkdir /data/
sudo mkdir /data/web_static/
sudo mkdir /data/web_static/releases/
sudo mkdir /data/web_static/shared/
sudo mkdir /data/web_static/releases/test/
echo "This is a Test!" | sudo tee /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/save_default
sudo sed -i "/server_name _;/a location /hbnb_static {\nalias /data/web_static/current;\n}\n" /etc/nginx/sites-available/default
sudo service nginx restart
