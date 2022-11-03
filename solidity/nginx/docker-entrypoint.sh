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
        git clone https://github.com/ethereum/browser-solidity.git .
fi
sudo cp /app/default.conf /etc/nginx/conf.d/default.conf
nginx -s reload
sudo chown -R nobody:nobody /var/www 2> /dev/null

sudo rm -rf /var/preview 2> /dev/null

exec "$@"
