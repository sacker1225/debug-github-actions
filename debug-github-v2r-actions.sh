#!/bin/bash

wget -q https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip v2ray-linux-64.zip -d v2r
chmod 755 -R v2r

echo "### download v2r success ### "

mkdir v2r/conf

cp -f config.json v2r/config.json
cp -f VMess-TCP-000.json v2r/conf/VMess-QUIC-000.json
echo HelloWorld | sed -i "s/47963/47962/g" VMess-TCP-000.json
echo HelloWorld | sed -i "s/quic/tcp/g" VMess-TCP-000.json
cp -f VMess-TCP-000.json v2r/conf/VMess-TCP-000.json

./v2r/v2ray run -config ./v2r/config.json -confdir ./v2r/conf &

sleep 10

echo "### v2ray running ###"

echo "vmess://ew0KICAidiI6ICIyIiwNCiAgInBzIjogIjIzM2JveS1xdWljLTAwMCIsDQogICJhZGQiOiAiMTI3LjAuMC4xIiwNCiAgInBvcnQiOiAiNDc5NjMiLA0KICAiaWQiOiAiM2FjOWE0ZjYtNTI3ZS00YmViLTg3NjMtODljMThjNjBhZTI4IiwNCiAgImFpZCI6ICIwIiwNCiAgInNjeSI6ICJhdXRvIiwNCiAgIm5ldCI6ICJxdWljIiwNCiAgInR5cGUiOiAibm9uZSIsDQogICJob3N0IjogIiIsDQogICJwYXRoIjogIiIsDQogICJ0bHMiOiAiIiwNCiAgInNuaSI6ICIiLA0KICAiYWxwbiI6ICIiLA0KICAiZnAiOiAiIg0KfQ=="
