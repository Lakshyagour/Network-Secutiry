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
pt = nb.bytes_to_long(m.encode('utf-8'))

n = 22088005140550380169596303116192572772945800392334294675034594358480749038874448830861653720561515988577999809453856068372440538974892366997725422283929263495629265149671074069925888690142764864905427265327874437102629693418391361160419841833776032911009370864268019581977443158519879323444793242426198607293193958766714714480117139767429570103683188142495372479647039650313789609589305433551869887149488541568286897946046120460881557297631454673195051217959671589200379856795109849531592435814712073160403749294004284081464280734010187853256336625447775418475371000492967725875161135653943775065184775537948565766713
e = 65537

ct = pow(pt,e,n)
print("Plain text: " + m, end="\n\n")
print("Cipher Text in long form (ct):", ct, end="\n\n")