#!/bin/bash


# the following three command you have to run int vlab
# openssl ecparam -name secp256k1 -genkey -out private.key  #agen Z private key
# openssl ec -in private.key -pubout -out public.key  # agent Z public key
# openssl pkeyutl -derive -out sharedKey.pem -inkey private.key -peerkey public-secp256k1.key # creating shared key wiht agentZ private key and agent X public key
# replace the sharedKey file with one generated in vlab do not copy paste replace it and copy the cipher text created in lab dir

openssl enc -aes-256-ctr -base64 -k "$(base64 sharedKey.pem)" -iv 102030506070ddff -d -in cipher.txt -out flags.txt # decrypt the message using the agents shared key