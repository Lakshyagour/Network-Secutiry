# PART 1 SOLUTION
cd Part1

#genrating the cipher-txt from the secret.txt text with all 5 algorithms given
#AES Advanced Encryption algorithm
# -e Encryption -d Decryption -in Input file -out Output File openssl enc command -K key -iv  Initialization Vector

#AES 128 bit ECB-Electronic Code block (does not need iv (initial vector))

openssl enc -aes-128-ecb -e -in secret.txt -out output-ecb.txt -K 55110062015112014aaff2d1f

#AES 128 bit CTR Counter Mode

openssl enc -aes-128-ctr -e -in secret.txt -out output-ctr.txt -K 55110062015112014aaff2d1f -iv 01020304055040302010


#AES 256 bit CBC Cipher Block Chaining

openssl enc -aes-256-cbc -e -in secret.txt -out output-cbc.txt -K 55110062015112014aaff2d1f -iv 01020304055040302010

#AES 256 bit CFB Cipher Feedback Mode

openssl enc -aes-256-cfb -e -in secret.txt -out output-cfb.txt -K 55110062015112014aaff2d1f -iv 01020304055040302010

#AES 256 bit OFB Output Feedback Mode

openssl enc -aes-256-ofb -e -in secret.txt -out output-ofb.txt -K 55110062015112014aaff2d1f -iv 01020304055040302010

#Calculating md5sum of all cipher generated and appending it into the flags.txt one after another

md5sum output-ofb.txt >> flags.txt 
md5sum output-ecb.txt >> flags.txt 
md5sum output-ctr.txt >> flags.txt 
md5sum output-cfb.txt >> flags.txt 
md5sum output-cbc.txt >> flags.txt 


# PART2 SOLUTION
cd ..
cd Part2


#AES 128 bit ECB-Electronic Code block (does not need iv (initial vector))

openssl enc -aes-128-ecb -d -in secret.bin -out output-ecb-128.txt -K 11152569842abcfdd5116

#AES 256 bit ECB-Electronic Code block (does not need iv (initial vector))

openssl enc -aes-256-ecb -d -in secret.bin -out output-ecb-256.txt -K 11152569842abcfdd5116

#AES 128 bit CTR Counter Mode

openssl enc -aes-128-ctr -d -in secret.bin -out output-ctr-128.txt -K 11152569842abcfdd5116 -iv 102030506070ddff

#AES 256 bit CTR Counter Mode

openssl enc -aes-256-ctr -d -in secret.bin -out output-ctr-256.txt -K 11152569842abcfdd5116 -iv 102030506070ddff

#AES 128 bit CBC Cipher Block Chaining

openssl enc -aes-128-cbc -d -in secret.bin -out output-cbc-128.txt -K 11152569842abcfdd5116 -iv 102030506070ddff

#AES 256 bit CBC Cipher Block Chaining

openssl enc -aes-256-cbc -d -in secret.bin -out output-cbc-256.txt -K 11152569842abcfdd5116 -iv 102030506070ddff

#AES 128 bit CFB Cipher Feedback Mode

openssl enc -aes-128-cfb -d -in secret.bin -out output-cfb-128.txt -K 11152569842abcfdd5116 -iv 102030506070ddff

#AES 256 bit CFB Cipher Feedback Mode

openssl enc -aes-256-cfb -d -in secret.bin -out output-cfb-256.txt -K 11152569842abcfdd5116 -iv 102030506070ddff

#AES 128 bit OFB Output Feedback Mode

openssl enc -aes-128-ofb -d -in secret.bin -out output-ofb-128.txt -K 11152569842abcfdd5116 -iv 102030506070ddff


#AES 256 bit OFB Output Feedback Mode

openssl enc -aes-256-ofb -d -in secret.bin -out output-ofb-256.txt -K 11152569842abcfdd5116 -iv 102030506070ddff