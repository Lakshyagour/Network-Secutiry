# looks like mallory generated a new symmetric key K1 and new message M1. now she encrypt the M1 with K1 and encrypt the K1 with public key of Z. Z has no way of knowing if integrity maintained or not.

# 1. Create MD5, and SHA256 hash of the file using openssl
md5sum secret.txt >> md5sum.txt
sha256sum  secret.txt >> sha256.txt

# 2. Create SHA256, and SHA512 MACs of this file using openssl. Use "sup3r_s3cret_k3y" as the key.
openssl dgst -sha256 -hmac "sup3r_s3cret_k3y" secret.txt >> sha256HMAC.txt
openssl dgst -sha512 -hmac "sup3r_s3cret_k3y" secret.txt >> sha512HMAC.txt

# 3. Create a "private.pem" file in "/home/labDirectory/part1/" directory and sign the secret.txt file with that private.pem key. 
# Once you sign it, create md5sum of the signature.

openssl genrsa -out private.pem 2048
openssl dgst -sha256 -sign private.pem -out data.sig secret.txt
md5sum data.sig >> md5sumOfSignature.txt

# manually put the flags  inside the flags.txt
