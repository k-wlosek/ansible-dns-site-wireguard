#!/bin/sh

FILE=/opt/adguardhome/conf/AdGuardHome.yaml

if [! test -f $FILE]
then
   curl -q -s -t 1 localhost:3000 > /dev/null && printf 'Waiting for config to be finished' || exit 1
elif [PORT="$(cat $FILE | grep '^bind_port:' | cut -f2 -d' ')" && ! curl -q -t 1 localhost:$PORT 2> /dev/null]
then
    exit 1
fi

if ! openssl x509 -checkend 0 -noout -in /opt/adguardhome/conf/fullchain.pem
then
  kill 1
fi