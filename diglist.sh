#!/bin/bash
# Made by TRASH PUPPY
#	2024

echo ""
echo -e "                    \033[1;32m :-- DIGLIST.SH: Gather DNS Records for multiple targets --:\033[0m"
echo ""

# Variable Declaration:
if [[ -z "$1" ]]; then
	echo -e ":--\033[1;33m Enter a file to use which contains newline-separated IP addresses and/ or hostnames: \033[0m"
	read -a file
else
	if [[ $(echo $1 | grep -e '-h\|--help' -c) -ne 0 ]]; then
		echo -e "\033[1;32m:-- HELP --:\033[0m"
		echo "Use diglist.sh to dig DNS records for a list of targets you provide."
		echo -e "\nSYNTAX: bash diglist.sh <target list> <record type>"
		echo "	- target list: a file containing a newline-separated list of addresses and/ or hostnames"
		echo "	- record type: any DNS record type supported by dig's '-t' flag:"
		echo -e "		(any, a, aaaa, txt, n, mx, cname, prt, soa, srv, caa...)\n"
		echo -e "\033[1;32m:-- . --:\033[0m"
		exit 1
	else
		file=$1
	fi
fi

if [[ -z "$2" ]]; then
	echo -e ":--\033[1;33m  What record type are you looking for? (ex: txt, any, a, n, aaaa, etc...): \033[0m"
	read -a record
else
	record=$2
fi

echo -e ":-- Digging \033[1;33m$file\033[0m for \033[1;33m$record\033[0m record types..."
echo ""

# Loop through provided file, line by line:
for line in $(cat $file); do
	# If current line item is not IP address format:
	if [[ $(echo $line | grep -E '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}' -c) -eq 0 ]]; then

		# Does the current item already have tld format?
		if [[ $(echo $line | grep -E '[[:alnum:]]{2,}\.[[:alnum:]]{2,}' -c) -ne 0 ]]; then
			target=$line
		else
			echo -e "_________________________\033[1;31m $line\033[0m _________________________\n"
			echo -e "           \033[31m INVALID ITEM: does not appear to be an IP or hostname. SKIPPING!\033[0m\n"
			continue
		fi
	else
		target="-x $line" # Little bit hacky lol
	fi

        echo -e "_________________________ \033[1;32m$target\033[0m _________________________"

	# Dig for domain name but check for results first:
	## ... Create variable "check" and set it equal to the length in characters of dig's short response to the current item:
	declare -i check=$(dig +short $target $record | wc -c)
	
	## ... If dig's short reply to the current item is 0, then don't print results:

	### ... PS this will not work for failed DNS lookups if you're using ATT. ATT returns an IP address of "143.244.220.150" to failed lookups...
	### ... See this GitHub issue: https://gist.github.com/CollinChaffin/24f6c9652efb3d6d5ef2f5502720ef00

	if [[ $check -eq 0 ]]; then
		echo -e ":--\033[1;31m NO RESULTS for $target\033[0m"
	else
		result=$(dig $target $record)
		echo -e ":--\033[1;32m RESULT:\033[0m $result" \
		&& sleep 0.1
	fi
	echo ""
done

echo -e "                    \033[1;32m :-- DONE --:\033[0m"
