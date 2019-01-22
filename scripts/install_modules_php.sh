#!/usr/bin/env bash

sudo apt-get install -y php-dom
sudo apt-get install -y php-ssh2
sudo apt-get install -y php-xml
sudo apt-get install -y php-curl
sudo apt-get install -y php-gd
sudo apt-get install -y php-imagick
sudo apt-get install -y php-mbstring
sudo apt-get install -y php-mysqli

service apache2 restart