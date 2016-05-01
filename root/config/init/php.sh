#!/bin/bash

echo "configure php"
cp /etc/appserver/php.ini /opt/appserver/etc/php.ini
for envname in ${!APPSERVER_PHP_*}; do
    sed -i "s/{${envname}}/${!envname}/g" /opt/appserver/etc/php.ini
done
