#!/usr/bin/python3
import Crypto.Util.number as nb
import argparse

# Initialize the Parser
parser = argparse.ArgumentParser(description ='Plain text to long converter')
  
# Adding Arguments
parser.add_argument('pt', 
                    type = str,
                    help ='Plain Text')
m = parser.parse_args().pt
print("Your plain text: " + m, end="\n\n")
print("Plain text to long conversion: ", nb.bytes_to_long(m.encode('utf-8')), end = "\n\n")