#!/bin/bash

openssl enc -aes-128-ecb -e -in secret.txt -K 55110062015112014aaff2d1f 2>> /dev/null | md5sum | cut -d' ' -f 1 >> flags.txt
openssl enc -aes-128-ctr -e -in secret.txt -K 55110062015112014aaff2d1f -iv 01020304055040302010 2>> /dev/null | md5sum | cut -d' ' -f 1 >> flags.txt
openssl enc -aes-256-cbc -e -in secret.txt -K 55110062015112014aaff2d1f -iv 01020304055040302010 2>> /dev/null | md5sum | cut -d' ' -f 1 >> flags.txt
openssl enc -aes-256-cfb -e -in secret.txt -K 55110062015112014aaff2d1f -iv 01020304055040302010 2>> /dev/null | md5sum | cut -d' ' -f 1 >> flags.txt
openssl enc -aes-256-ofb -e -in secret.txt -K 55110062015112014aaff2d1f -iv 01020304055040302010 2>> /dev/null | md5sum | cut -d' ' -f 1 >> flags.txt
