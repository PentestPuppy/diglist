#!/bin/bash
# Made by TRASH PUPPY
#	2024

echo ""
echo -e "                    \033[32m :-- DNS RECORDS --:\033[0m"
echo ""

# Variable Declaration:
if [[ -z "$1" ]]; then
	echo ":-- Enter a file to use which containes new line separated IP addresses and/ or hostnames: "
	read -a file
else
	file=$1
fi

if [[ -z "$2" ]]; then
	echo ":-- Enter the root domain:"
	read -a root
else
	root=$2
fi

# Check for what type of record they want:
if [[ -z "$3" ]]; then
	echo ":-- What record type are you looking for? (ex: txt, all, a, n, aaaa): "
	read -a record
else
	record=$3
fi

echo -e ":-- Digging \033[32m$file\033[0m for \033[32m$record\033[0m record types..."
echo ""

<<<<<<< HEAD
for line in $(cat $ipfile); do
        echo -e "_________________________ \033[32m$line\033[0m _________________________"

	result=$(dig $line $record && sleep 0.5)
	echo -e ":--\033[32mRESULT:\033[0m $result"	
=======
for line in $(cat $file); do
	# If current item is not IP address format:
	if [[ $(echo $line | grep -E '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}' -c) -eq 0 ]]; then
		# Does the current item already have tld format?
		if [[ $(echo $line | grep -E '[[:alnum:]]{2,}\.[[:alnum:]]{2,}' -c) -ne 0 ]]; then
			target=$line
		else
			target=$(echo $line\.$root)
		fi
	else
		target="-x $line" # Little bit hacky lol
	fi
>>>>>>> 5bcca3408a9c6944d4247f0036e666bd4e09e2a6

        echo -e "_________________________ \033[32m$target\033[0m _________________________"
	# Dig for domain name but check for results first:
	if [[ $(dig +short $target $record | wc -c) -eq 0 ]]; then
		echo -e ":--\033[31m NO RESULTS for $target\033[0m"
	else
		result=$(dig $target $record)
		echo -e ":--\033[32m RESULT:\033[0m $result" \
		&& sleep 0.1
	fi
done

echo ""
echo -e "                    \033[32m :-- DONE --:\033[0m"
