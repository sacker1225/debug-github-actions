#!/bin/bash

wget -q https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip v2ray-linux-64.zip -d v2r
chmod 755 -R v2r

echo "### download v2r success ### "

mkdir v2ray/config

cp -f config.json v2ray/config.json
cp -f VMess-TCP-000.json v2ray/config

./v2ray run -config ./v2ray/config.json -confdir ./v2ray/conf &

sleep 10

echo "### v2ray running ###"
