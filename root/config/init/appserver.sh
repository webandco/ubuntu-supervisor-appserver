#!/bin/bash

set -e
set -u

echo "configure appserver"
sed -i "s/www-data/root/g" /opt/appserver/etc/appserver/appserver.xml
sed -i "s/9080/80/g"  /opt/appserver/etc/appserver/appserver.xml
sed -i "s/9443/443/g" /opt/appserver/etc/appserver/appserver.xml
sed -i "s/var\/log\/appserver-errors.log/php:\/\/stderr/g" /opt/appserver/etc/appserver/appserver.xml
sed -i "s/var\/log\/appserver-access.log/php:\/\/stdout/g" /opt/appserver/etc/appserver/appserver.xml
sed -i "s/DeploymentScanner/SupervisorDeploymentScanner/g" /opt/appserver/etc/appserver/appserver.xml
