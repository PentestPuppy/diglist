#!/bin/bash
# Made by TRASH PUPPY
#	2024

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

if [[ -z "$2" ]]; then
	echo ":-- Enter the root domain:"
	read -a root
else
	root=$2
fi

# Check for what type of record they want:
if [[ -z "$3" ]]; then
	echo ":-- What record type are you looking for? (ex: 'txt'): "
	read -a record
else
	record=$3
fi

echo -e ":-- Digging \033[32m$ipfile\033[0m for \033[32m$record\033[0m record types..."
echo ""

for line in $(cat $ipfile); do
        echo -e "_________________________ \033[32m$line.$root\033[0m _________________________"

	# Check for results first
	if [[ $(dig +short $line\.$root $record | wc -c) -eq 0 ]]; then
		echo -e ":--\033[31m NO RESULTS for $line\033[0m"
	else
		result=$(dig $line\.$root $record)
		echo -e ":--\033[32m RESULT:\033[0m $result" \
		#&& sleep 0.1
	fi
done

echo ""
echo -e "                    \033[32m :-- DONE --:\033[0m"
