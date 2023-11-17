Find Open TCP PORT int this ranges
nmap -p0-100,1500-2500,50000-60000 -sV -oG - 127.0.0.1 

Find Open UDP PORT int this ranges
nmap -p0-100,1500-2500,50000-60000 -sU -oG - 127.0.0.1 

nc -nv 127.0.0.1 48127