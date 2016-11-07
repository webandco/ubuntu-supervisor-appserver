#!/bin/bash

set -e
set -u

echo "configure php-fpm"
sed -i "s/;error_log = log\/php-fpm.log/error_log = \/proc\/self\/fd\/2/g" /opt/appserver/etc/php-fpm.conf
sed -i "s/\/opt\/appserver\/var\/log\/php_errors.log/\/proc\/self\/fd\/2/g" /opt/appserver/etc/php.ini
sed -i "s/\/opt\/appserver\/var\/log\/php-fpm-fcgi_errors.log/\/proc\/self\/fd\/2/g" /opt/appserver/etc/php-fpm-fcgi.ini