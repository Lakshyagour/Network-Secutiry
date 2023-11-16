#!/bin/bash


openssl md5 secret.txt > md5_hash.txt
openssl sha256 secret.txt > sha256_hash.txt
openssl dgst -sha256 -hmac "sup3r_s3cret_k3y" secret.txt > sha256_mac.txt
openssl dgst -sha512 -hmac "sup3r_s3cret_k3y" secret.txt > sha512_mac.txt
openssl genpkey -algorithm RSA -out private.pem
openssl dgst -sha256 -sign private.pem -out signature.bin secret.txt
openssl dgst -md5 signature.bin > signature_md5.txt