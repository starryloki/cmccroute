#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# CMCC BGP
wget --no-check-certificate -c -O cmcc.txt https://ispip.clang.cn/cmcc_cidr.txt

{
echo "/ip route"

for net in $(cat cmcc.txt) ; do
  echo "add dst-address=$net gateway=pppoe-cmcc routing-table=main comment=cmcc-route"
done

} > ../cmcc.rsc

cd ..
rm -rf ./pbr
