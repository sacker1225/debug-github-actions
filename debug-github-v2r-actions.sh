#!/bin/bash

wget -q https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip v2ray-linux-64.zip -d v2r
chmod 755 -R v2r

echo "### download v2r success ### "

mkdir v2ray/config

cp -f config.json v2ray/config.json
cp -f VMess-TCP-000.json v2ray/config

./v2ray run -config ./v2r/config.json -confdir ./v2r/conf &

sleep 10

echo "### v2ray running ###"

echo "vless://3c16baca-de3a-47dc-9fb8-f5fbc6b616a4@127.0.0.1:43963?encryption=none&security=reality&flow=xtls-rprx-vision&type=tcp&sni=www.ebay.com&pbk=7Vem4qMZbHtnS271U28GDP6H73lUjm_CfiEK8SLnAkM&fp=chrome#233boy-reality-127.0.0.1"
