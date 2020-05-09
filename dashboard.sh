sudo apt-get install lighttpd

sudo groupadd www-data

sudo usermod -G www-data -a pi

sudo chown -R www-data:www-data /var/www/html

sudo chmod -R 775 /var/www/html

sudo apt-get install php7.0-common php7.0-cgi php

sudo lighty-enable-mod fastcgi

sudo lighty-enable-mod fastcgi-php

sudo service lighttpd force-reload
cd /
cd opt
cd dmr
sudo mkdir tmp
cd tmp
sudo git clone https://github.com/Do4kgt/html.git
sudo chmod -R 777 /var/www/html
sudo rm /var/www/html/*
sudo cp -r /opt/dmr/tmp/html/ /var/www
sudo rm -r /opt/dmr/tmp/
cd ..
