#!/usr/bin/python3
import Crypto.Util.number as nb
import argparse

# Initialize the Parser
parser = argparse.ArgumentParser(description ='Long to ascii converter')
  
# Adding Arguments
parser.add_argument('longval', 
                    type = int,
                    help ='Long value')
longval = parser.parse_args().longval
print("Your long value:", longval, end="\n\n")
print("Long to ascii conversion: ", nb.long_to_bytes(longval).decode('utf-8'), end = "\n\n")