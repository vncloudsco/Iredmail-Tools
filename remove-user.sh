#!/bin/sh
#
# Author: 	Daulton
# Website: 	daulton.ca
# Purpose: 	Removes a user account from the database in iRedmail, this does not delete the mailbox stored on the filesystem.
# License: 	2-clause BSD license
#
# Example usage: sh remove-user.sh jeff@example.com
# 
# This will print SQL commands on the console directly, you can redirect the
# output to a file for further use like this:
#
# sh sh remove-user.sh jeff@example.com > output.sql
#
# Import output.sql into SQL database like below:
#
# mysql -uroot -p
# mysql> USE vmail;
# mysql> SOURCE /path/to/output.sql;
#
# psql -d vmail
# sql> \i /path/to/output.sql;

# Read input
address="$1"

if [ "$1" == "-h" ] || [ "$1" == "--h" ] || [ "$1" == "/h" ] || [ $# -eq 0 ]; then
	printf "Purpose: Removes a user account from the database in iRedmail, this does not delete the mailbox stored on the filesystem. \n"
	printf "Usage: sh remove-user.sh jeff@example.com \n"
	exit 0
fi

printf "DELETE from forwardings WHERE address = '${address}' AND forwarding = '${address}'; \n"
printf "DELETE from mailbox WHERE username = '${address}'; \n"
