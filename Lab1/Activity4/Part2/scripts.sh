!/bin/bash

openssl pkeyutl -decrypt -in encrypted.txt -out decrypted.txt -inkey private.key 
