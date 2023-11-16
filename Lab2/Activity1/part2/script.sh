#!/bin/bash

res=$(base64 secret.sign)

openssl dgst -sha256 -sign keys/client1.pem -out signature.bin secret.txt
tmp=$(base64 signature.bin)

if [ "$res" == "$tmp" ]; then
    echo "Found Matching Private Key : client1.key"
fi
openssl dgst -sha256 -sign keys/client2.pem -out signature.bin secret.txt
tmp=$(base64 signature.bin)

if [ "$res" == "$tmp" ]; then
    echo "Found Matching Private Key : client2.key"
fi

openssl dgst -sha256 -sign keys/client3.pem -out signature.bin secret.txt
tmp=$(base64 signature.bin)

if [ "$res" == "$tmp" ]; then
    echo "Found Matching Private Key : client3.key"
fi