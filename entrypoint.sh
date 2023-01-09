#!/bin/bash

if [[ -z "${Password}" ]]; then
  Password="5c301bb8-6c77-41a0-a606-4ba11bbab084"
fi

#V2Ray Configuration
Server_Path="/adwwqAqd"

mkdir /wwwroot

mv /v2-server /usr/bin/v2-server

if [ ! -d /etc/server ]; then  
  mkdir /etc/server
fi

sed -e "/^#/d"\
    -e "s/\${PASSWORD}/${Password}/g"\
    -e "s|\${Server_Path}|${Server_Path}|g"\
    /conf/server-config.json >  /etc/server/config.json

echo /etc/server/config.json

cat /etc/server/config.json

sed -e "/^#/d"\
    -e "s/\${PORT}/${PORT}/g"\
    -e "s|\${Server_Path}|${Server_Path}|g"\
    -e "$s"\
    /conf/nginx.conf > /etc/nginx/conf.d/ss.conf 

v2-server run -c /etc/server/config.json &

rm -rf /etc/nginx/sites-enabled/default
nginx -g 'daemon off;'
