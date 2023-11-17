#part 1 solution
cd part1
openssl rsa -in private.key -pubout -out public.key
openssl pkeyutl -encrypt -in secret.txt -out encrypted.txt -pubin -inkey public.key 
md5sum encrypted.txt >> flags.txt


#  **EXTRA Question**: Try the encryption multiple times and create md5sum of it, you will notice different md5sums every time, meaning the cipher text changes on every encryption. Can you figure out why is this happening?
# openssl pkeyutl -encrypt -in secret.txt -out encrypted.txt -pubin -inkey public.key 
# md5sum encrypted.txt >> flags.txt

cd ..
cd part2
# Part 2 Solution

openssl pkeyutl -decrypt -in encrypted.txt -out decrypt1.txt -inkey key1.pem 

# key2 was public key 
# openssl pkeyutl -decrypt -in encrypted.txt -out decrypt2.txt -inkey key2.pem 