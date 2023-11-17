# Part-2: Verification of the Signatures

# You are given "secret.txt" and "secret.sign" in "/home/labDirectory/part2" directory and also 3 client private keys in "/home/labDirectory/part2/keys" directory. 
# You need to find out which one of the private keys was used to sign the secret.txt file using openssl.


openssl dgst -sha256 -sign keys/client1.pem -out client1.sign secret.txt

openssl dgst -sha256 -sign keys/client2.pem -out client2.sign secret.txt

openssl dgst -sha256 -sign keys/client3.pem -out client3.sign secret.txt

# Use cmp to compare the two files
if cmp -s "secret.sign" "client1.sign"; then
  echo "client1.pem key is used"

if cmp -s "secret.sign" "client2.sign"; then
  echo "client2.pem key is used"

if cmp -s "secret.sign" "client3.sign"; then
  echo "client3.pem key is used"

#  client2.pem is the key used to sign the secret.txt


# Once you identify the key used for signing the secret.txt file, use "rsa-utility.py" given in "/home/labDirectory/part2" 
# to get details about the private key, and submit p (Prime 1), q (Prime 2), and d (Decryption key) in metadata.txt available within "/home/labDirectory/part2" directory 
# in the format suggested in the metadata.txt.

python3 rsa-utility.py keys/client2.pem 