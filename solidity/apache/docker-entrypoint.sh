#!/bin/bash
set +x
if [[ -f "/var/www/background.js" ]] ;
then
    echo "Already installed."

fi
if [[ "$(ls -A "/var/www/")" ]] ;
    then
        echo "If the Directory is not empty, please delete the hidden files and directory"
    else
        sudo git clone https://github.com/ethereum/browser-solidity.git .
fi

sudo cp /app/httpd.conf /etc/apache2/httpd.conf
httpd -k graceful
sudo chown -R apache:apache /var/www 2> /dev/null
rm -rf /var/preview 2> /dev/null

exec "$@"