apt-get update

#install appserver
echo "deb http://deb.appserver.io/ wheezy main" > /etc/apt/sources.list.d/appserver.list && wget http://deb.appserver.io/appserver.gpg -O - | apt-key add -
apt-get -y update \
    && apt-get install -y appserver-dist \
    && rm -rf /var/lib/apt/lists/*

#install git
apt-get -y install git

#delete package cache
rm -rf /var/lib/apt/lists/*

#set php for commandline operations
ln -s /opt/appserver/bin/php /usr/bin/php

#setup composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

#set helfpul flow commands
cp /etc/.bash_aliases ~/.bash_aliases
. ~/.bash_aliases

chmod 777 /config/bootstrap.sh