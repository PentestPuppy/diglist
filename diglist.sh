#!/bin/bash

# Made by TRASH PUPPY 
#	2024
#

echo ""
echo -e "                    \033[32m :-- DNS RECORDS --:\033[0m"
echo ""

# Variable Declaration:
if [[ -z "$1" ]]; then
	echo ":-- Enter a file to use which containes new line separated IP addresses and/ or hostnames: "
	read -a ipfile
else
	ipfile=$1
fi	

# Check for what type of record they want:
if [[ -z "$2" ]]; then
	echo ":-- What record type are you looking for? (ex: 'txt'): "
	read -a record
else
	record=$2
fi

echo -e ":-- Digging \033[32m$ipfile\033[0m for \033[32m$record\033[0m types..."

for line in $(cat $ipfile); do
        echo -e "_________________________ \033[32m$line\033[0m _________________________"

result=$(dig $line $record & sleep 0.5)
	echo -e ":--\033[32mRESULT:\033[0m $result"	

done

echo ""
echo -e "                    \033[32m :-- DONE --:\033[0m"

