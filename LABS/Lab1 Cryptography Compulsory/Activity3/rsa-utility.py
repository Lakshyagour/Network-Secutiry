# !/usr/bin/python3
from Crypto.PublicKey import RSA
import argparse
  
  
# Initialize the Parser
parser = argparse.ArgumentParser(description ='RSA Utility Tool')
  
# Adding Arguments
parser.add_argument('file', 
                    type = str,
                    help ='privateKeys/private3.key')
fileName = parser.parse_args().file
with open(fileName, mode='rb') as privatefile:
    keydata = privatefile.read()

private_key = RSA.import_key(keydata)

print("RSA Private Key Details:\n")
print("\nModulus (n): \n", private_key.n)
print("\nExponent (e): \n", private_key.e)
print("\nPrivate Exponent (d): \n", private_key.d)
print("\nP Factor (p): \n", private_key.p)
print("\nQ Factor  (q): \n", private_key.q)
print("\nInverse Q (u): \n", private_key.u)