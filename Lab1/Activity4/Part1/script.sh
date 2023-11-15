#!/bin/bash

openssl rsa -in private.key -pubout -out public.key
openssl pkeyutl -encrypt -in secret.txt -out encrypted.txt -pubin -inkey public.key 
openssl pkeyutl -decrypt -in encrypted.txt -out decrypted.txt -inkey private.key 
md5sum encrypted.txt | cut -d' ' -f 1 > flags.txt