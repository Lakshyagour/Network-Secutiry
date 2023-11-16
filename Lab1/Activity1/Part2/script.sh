#!/bin/bash

openssl enc -aes-128-ecb -d -in secret.bin -K 55110062015112014aaff2d1f 
openssl enc -aes-128-ctr -d -in secret.bin -K 55110062015112014aaff2d1f -iv 01020304055040302010 
openssl enc -aes-256-cbc -d -in secret.bin -K 55110062015112014aaff2d1f -iv 01020304055040302010 
openssl enc -aes-256-cfb -d -in secret.bin -K 55110062015112014aaff2d1f -iv 01020304055040302010 
openssl enc -aes-256-ofb -d -in secret.bin -K 55110062015112014aaff2d1f -iv 01020304055040302010