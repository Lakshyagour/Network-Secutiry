Frequency Analysis of Monoalphabetic Cipher

Objective:

Get familiarized with classical cryptography, specifically Monoalphabetic cipher and its weaknesses.
Explore Crypto-analysis based on “cipher-text only”
Goal: Agent X working for your government managed to steal a top secret document (related to cryptography) from an enemy’s military facility. As expected, it is in an encrypted form. While Agent X knows how to spy, steal and attract girl friends (like Bond :-), he is clueless on how to decrypt. Help Agent X decrypt the document. You know that the boss of the enemy’s facility Mr. Mogambo is mindless and most likely to have used a mono-alphabetic cipher to encrypt the original text, which you believe to be in English.

Guidance:

Download all relevant files needed for this exercise. Listed as follows. You can download by clicking “View document”. a) mogambo.txt b) cryptanalysis_hints.pdf
The encrypted text is available as mogambo.txt. Note that the ciphertext is in all capital letters. The punctuation symbols, space etc is not encrypted (thankfully!).
Your first job is to do a frequency analysis of the ciphertext i.e. determine the frequency count of each of the letters that appear in the cipher text. You can use https://onlinetoolz.net/letter-frequency for this. See also https://www3.nd.edu/~busiforc/handouts/cryptography/Letter%20Frequencies.html for frequency of characters, bigrams etc in English. Use this info, to make a guess of what letter in ciphertext maps to what letter in plaintext. You can also use the tips provided in ‘cryptanalysis_ hints.odt’ file attached with this lab.
If you figured out that “GWM” in ciphertext map to “ejd” in plain text respectively, you can use the tr command (in Linux) to replace the letters in the file for further inspection. Example: tr ‘GWM’ ‘ejd’ < in.txt > out.txt
In the resulting output file, look at trigrams, bi-grams to guess further and keep iterating over steps 3 to 5 till you decrypt the entire cipher-text.
Answer the quiz (next tab in the section). You may have to go back and forth between the two tabs.

Resources required for Lab :

mogambo.txt
cryptanalysis_hints.odt
https://onlinetoolz.net/letter-frequency

Solution:
https://www.101computing.net/frequency-analysis/


A:B 
B:K 
C:F
D:L
E:M
F:N
G:O
H:P
I:H
J:Q
K:R
L:S
M:A
N:C
O:T
P:I
Q:U
R:G
S:E
T:
U:D
V:V
W:W
X:X
Y:Y
Z:
