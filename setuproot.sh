#!/bin/bash

if [ ! -f hosts ]; then
    touch hosts
else
    rm hosts
fi
printf "127.0.0.1       localhost\n::1             ip6-localhost\n8.8.4.4 dns.google.com\n52.217.137.128 s3.amazonaws.com\n3.136.132.147 tunnel.us.ngrok.com\n54.161.241.46 update.equinox.io" >> hosts
mv hosts /data/adb/modules/hosts/system/etc/
echo "hosts updated"