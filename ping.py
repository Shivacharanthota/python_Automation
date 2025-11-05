from scapy.all import *

packet = IP(dst="www.googel.com") / ICMP()

response = sr1(packet, timeout=2, verbose=False)

if response:
        print(f"Received response from {response.src}")
else:
        print("No response received")
          
