#!/bin/bash
low=0.0.0
high=255.255.255

if [ "$1" = "" ]
then
	echo "Please Enter and IP address!"
	echo "Syntax Error!"
	echo "Example : ./pingsweep.sh 192.168.1"
elif [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]];
then
	if [[ ($1 > $low) && ($1 < $high) ]];
		then
			echo "Live Hosts: "
			for ip in `seq 1 254`; do
				ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
			done
			echo "Other Hosts may unavailable or Blocking the ICMP"
		else
			echo "Invalid IP address";
	fi
else
	echo "Enter a Valid IP Block (3 Octect)"
	echo "Example: ./pingsweep.sh 192.168.1"	
fi
