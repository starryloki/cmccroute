#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# CMCC BGP
wget --no-check-certificate -c -O cmcc.txt https://ispip.clang.cn/cmcc_cidr.txt

{
echo "/ip firewall address-list"

for net in $(cat cmcc.txt) ; do
  echo "add list=cmcc address=$net comment=cmcc-route"
done

} > ../cmcc.rsc

cd ..
rm -rf ./pbr
