# Part of lab exrecises for practice purposes
# mkdir temp
# cd temp/ 

# openssl ecparam -list_curves
# openssl ecparam -name secp256k1 -genkey -out alicepriv.pem
# # cat alicepriv.pem 

# openssl ecparam -in alicepriv.pem -text -param_enc explicit -noout
# openssl ec -in alicepriv.pem -pubout -out alicepub.pem
# # cat alicepub.pem 

# openssl ec -in alicepriv.pem -text -noout
# openssl ecparam -name secp256k1 -genkey -out bobpriv.pem

# openssl ec -in bobpriv.pem -pubout -out bobpub.pem

# openssl pkeyutl -derive -out abkey1.pem -inkey alicepriv.pem -peerkey bobpub.pem 
# openssl pkeyutl -derive -out abkey2.pem -inkey bobpriv.pem -peerkey alicepub.pem 

# diff abkey1.pem abkey2.pem 

# cd ..
# Part of solution

openssl ecparam -name secp256k1 -genkey -out private.key
# cat private.key 

openssl ec -in private.key -pubout -out public.key

openssl pkeyutl -derive -out sharedKey.pem -inkey private.key -peerkey public-secp256k1.key 
# cat sharedKey.pem

openssl enc -aes-256-ctr -base64 -k $(cat sharedKey.pem| base64) -iv 102030506070ddff -d -in cipher.txt -out flags.txt
