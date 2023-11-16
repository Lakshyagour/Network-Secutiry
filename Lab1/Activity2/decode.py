#!/bin/python

def xor_hex_strings(hex_str1, hex_str2, block_size):

    bin_str1 = bin(int(hex_str1, 16))[2:].zfill(len(hex_str1) * 4)
    bin_str2 = bin(int(hex_str2, 16))[2:].zfill(len(hex_str2) * 4)

    result = ''
    for i in range(0, len(bin_str1), block_size):
        block1 = bin_str1[i:i+block_size]
        block2 = bin_str2[i:i+block_size]

        xor_result = int(block1, 2) ^ int(block2, 2)
        result += format(xor_result, f'0{block_size}b')

    result_hex = hex(int(result, 2))[2:]

    return result_hex.zfill(len(result_hex) + (len(result_hex) % 2))

p1 = '48656c6c6c6f20576f726c64215f616136323562643764323731306633353930343163303935'
c1 = 'd63aaca84457fa5825d8430e25179c3e1e079e488d5e77d78896b2a06188d923474f8904e69f'
c2 = 'f833a1a35373924e7fc86b5c6900870e7f019e588c2f23aafec3b5b037ccd1263b26875997d7'

block_size = 128

c1_dash = xor_hex_strings(p1, c1, block_size)
print("C1':", c1_dash)

p2 = xor_hex_strings(c2, c1_dash, block_size)
print("P2 :",bytes.fromhex(p2).decode('utf-8'))