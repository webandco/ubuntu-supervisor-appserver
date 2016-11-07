#!/bin/bash

set -e
set -u

apt-get update

#install git
apt-get -y install git gdebi-core

#install appserver runtime
wget -O /tmp/appserver-runtime.deb http://builds.appserver.io/linux/debian/8/appserver-runtime_1.1.6-44~deb8_amd64.deb
gdebi --non-interactive /tmp/appserver-runtime.deb
rm -f /tmp/appserver-runtime.deb

# create a symlink for the appserver.io PHP binary
ln -s /opt/appserver/bin/php /usr/local/bin/php

#setup composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

#install appserver dist
wget -O /tmp/appserver-dist.tar.gz https://github.com/appserver-io/appserver/archive/1.1.3.tar.gz
tar -xzvf /tmp/appserver-dist.tar.gz -C /tmp
cd /tmp/appserver-1.1.3/
composer install --no-interaction --prefer-source
cp -R /tmp/appserver-1.1.3/* /opt/appserver

#copy appserver settings
ls /opt/appserver

#delete package cache
rm -rf /var/lib/apt/lists/*

#set helfpul flow commands
cp /etc/.bash_aliases ~/.bash_aliases
. ~/.bash_aliases

echo "set permissions"
chmod 777 /config/bootstrap.sh