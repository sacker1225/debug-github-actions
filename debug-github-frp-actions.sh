#!/bin/bash

if [[ -z "$FRP_SERVER_ADDR" ]]; then
  echo "Please set 'FRP_SERVER_ADDR'"
  exit 2
fi

if [[ -z "$FRP_SERVER_PORT" ]]; then
  echo "Please set 'FRP_SERVER_PORT'"
  exit 3
fi

if [[ -z "$FRP_TOKEN" ]]; then
  echo "Please set 'FRP_TOKEN'"
  exit 4
fi

echo "### Install frp ###"

wget -q https://github.com/fatedier/frp/releases/download/v0.58.0/frp_0.58.0_linux_amd64.tar.gz
tar -xvf frp_0.58.0_linux_amd64.tar.gz
mv frp_0.58.0_linux_amd64/frpc .
chmod +x ./frpc

echo "### Update user: $USER password ###"
echo -e "$USER_PASS\n$USER_PASS" | sudo passwd "$USER"

echo "### Start frpc proxy for 22 port ###"

wget -q https://github.com/sacker1225/debug-github-actions/raw/main/frpc.toml

echo HelloWorld | sed -i "s/{FRP_SERVER_ADDR}/$FRP_SERVER_ADDR/g" frpc.toml
echo HelloWorld | sed -i "s/{FRP_SERVER_PORT}/$FRP_SERVER_PORT/g" frpc.toml
echo HelloWorld | sed -i "s/{FRP_TOKEN}/$FRP_TOKEN/g" frpc.toml

./frpc -c frpc.toml &

sleep 10

cat frpc.log | head -n 7
echo ""
echo "=========================================="
echo "To connect: $USER"
echo "=========================================="
