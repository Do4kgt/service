#!/bin/sh
# DO4KGT Install MMDVMHost

cd /
sudo apt-get install screen
cd opt
sudo mkdir dmr1
cd dmr1
sudo git clone https://github.com/Do4kgt/MMDVMHost.git
sudo git clone https://github.com/Do4kgt/DMRGateway.git
sudo mkdir log
sudo mkdir ini
sudo git clone https://github.com/Do4kgt/NextionDriver

sudo apt-get install lighttpd

sudo groupadd www-data

sudo usermod -G www-data -a pi

sudo chown -R www-data:www-data /var/www/html

sudo chmod -R 775 /var/www/html

sudo apt-get install php7.0-common php7.0-cgi php

sudo lighty-enable-mod fastcgi

sudo lighty-enable-mod fastcgi-php

sudo service lighttpd force-reload

sudo mkdir tmp
cd tmp
sudo git clone https://github.com/Do4kgt/html.git
sudo chmod -R 777 /var/www/html
sudo rm /var/www/html/*
sudo cp -r /opt/dmr1/tmp/html/ /var/www/html
cd ..
sudo git clone https://github.com/Do4kgt/Service_data.git
cd Service_data
echo 'Kopieren und aktivieren der Servicedaten'

sudo cp dmrgateway.service /etc/systemd/system/dmrgateway.service
sudo cp log.service /etc/systemd/system/log.service
sudo cp mmdvmhost.service /etc/systemd/system/mmdvmhost.service
sudo cp nextion.service /etc/systemd/system/nextion.service

sudo systemctl daemon-reload

sudo systemctl enable dmrgateway.service
sudo systemctl enable log.service
sudo systemctl enable mmdvmhost.service
sudo systemctl enable nextion.service


cd ..
sudo chmod 777 -R /opt/
sudo rm -r Service_data
sudo rm -r tmp
