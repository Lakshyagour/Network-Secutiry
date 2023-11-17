
#  run this netcat command to contact the port 9001 it give n and e and  will ask for the ecrypted text
nc -nv 127.0.0.1 9001

# put the n and e into the encryptor.py file and run that py file with plaintext for example "Hello World!" this will give you the ecncrypted cipher text now put this cipher 
#  into the port 9001 it will decrypt with Hello world in  a long format

python3 utils/encryptor.py "Hello World!"

#  convert that long to ascii format
python3 utils/long-to-ascii-converter.py 22405534230753928650781647905



c2 = (m2)^e mod n #say m2= hello world in long long format we encrypt it and c1

c1 = (m1)^e mod n #say m1= "hidden message" in long long format server has given its encrypted  c1 in long long fomrat

c1*c2 = (m1*m2)^e mod n
or
C=(M)^e mod n
# we will feed this c1*c2=C (long long value) to server it will revert with decrypted value (in long long) which should be m1*m2

# now we know m1*m2 and we knew m2=Hello world (in long long) then m1 (hidden message ) should be M/m2 ==> m1*m2/m2 ==> m1 reuired flag