#!/bin/bash
IRD="/bin/ird/iredmailcontrol"
	RED='\033[0;41;30m'
	STD='\033[0;0;39m'
 
		pause(){
 			 read -p "Press [Enter] key to continue..." fackEnterKey
		}

	one(){
		echo "one() called"
        pause
	}
 
	two(){
		echo "two() called"
        	pause
	}
 
	show_menus() {
		clear
		echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"	
		echo " MTDEV Manage Iredmail Control Menu  "
		echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		echo "1. Creates a new user"
		echo "2. Delete a user"
		echo "3. Update a users password"
		echo "4. De-activate a user account"
		echo "5. Re-activate a user account"
		echo "6. List active user accounts"
		echo "7. List inactive user accounts"
		echo "8. Lists all from the forwardings"
		echo "9. Enables pop3 for a user account"
		echo "10. Enables IMAP for a user account"
		echo "11. Disables pop3 for a user account"
		echo "12. Disables IMAP for a user account"
		echo "13. Increases the mail box quota size"
		echo "14. Create an alias"
		echo "15. Add a user to an alias"
		echo "16. Creates or updates an access policy "
		echo "17. Remove a given alias"
		echo "18. Set an alias as active"
		echo "19. Set an alias as inactive"
		echo "20. Check if a given email address is an alias"
		echo "21. List any configured forwards"
		echo "22. Deletes mail forwarding from a given address"
		echo "23. Forward mail from one user account to another"
		echo "24. List if any addresses are set to forward to a given address"
		echo "25. List if any addresses are set to forward fromm a given address"
		echo "26. Disables mail forwarding from a given address to another entered address"
		echo "27. Updates the domain wide mailbox quota"
		echo "28. Enables a domain in the database, must exist already"
		echo "29. Disables a domain in the database"
		echo "30. List the top 10 mailboxes by size"
		echo "31. List mailbox size from largest to smallest"
		echo "32. change the database value of 'vmail1' to a new value"
		echo "33. change the database value of '/var/vmail' to a new value"
		echo "34. thoat"

	}

	read_options(){
		local choice
		read -p "Enter choice [ 1 - 34]: " choice
		case $choice in

			1 ) 
				sh $IRD/create-new-user.sh
				echo "Nhap tai khoan và mat khau"
				read user
				sh create-new-user.sh $user
				;;

			2 ) 
				sh $IRD/remove-user.sh
				echo "nhap user"
				read remove
				sh $IRD/remove-user.sh $remove
				;;
			3 ) 
				echo "nhap user can updates"
				read user
				sh $IRD/update-account-password.sh
				;;

			4 ) 
				echo "nhap user"
				read user
				sh $IRD/disable-mail-forwarding.sh
				;;

			5 ) 
				echo "nhap user"
				read user
				sh $IRD/disable-mail-forwarding.sh
				;;
			6 ) 
				echo "nhap user"
				read user
				sh $IRD/list-active-accounts.sh
				;;
			7 ) 
				echo "nhap user"
				read user
				sh $IRD/list-inactive-accounts.sh
				;;
			8 ) 
				echo "nhap user"
				read user
				sh $IRD/list-all-but-regular-accounts.sh	
				;;
			9 ) 
				echo "nhap user"
				read user
				sh $IRD/enable-pop3-for-user.sh
				;;
			10 ) 
				echo "nhap user"
				read user
				sh $IRD/enable-imap-for-user.sh
				;;
			11 ) 
				echo "nhap user"
				read user
				sh $IRD/disable-pop3-for-user.sh
				;;
			12 ) 
				echo "nhap user"
				read user
				sh $IRD/disable-imap-for-user.sh
				;;
			13 ) 
				echo "nhap user"
				read user
				sh $IRD/increase-mailbox-quota.sh
				;;
			14 ) 
				echo "nhap user"
				read user
				sh $IRD/create-alias.sh
				;;
			15 ) 
				echo "nhap user"
				read user
				sh $IRD/add-user-to-alias.sh
				;;
			16 ) 
				echo "nhap user"
				read user
				sh $IRD/create-alias-policy.sh
				;;
			17 ) 
				echo "nhap user"
				read user
				sh $IRD/remove-alias.sh
				;;
			18 ) 
				echo "nhap user"
				read user
				sh $IRD/set-alias-active.sh
				;;
			19 ) 
				echo "nhap user"
				read user
				sh $IRD/set-alias-inactive.sh
				;;
			20 ) 
				echo "nhap user"
				read user
				sh $IRD/is-address-an-alias.sh
				;;
			21 ) 
				echo "nhap user"
				read user
				sh $IRD/list-forwarding.sh
				;;
			22 ) 
				echo "nhap user"
				read user
				sh $IRD/remove-forwarding.sh
				;;
			23 ) 
				echo "nhap user"
				read user
				sh $IRD/add-mail-forward.sh
				;;
			24 ) 
				echo "nhap user"
				read user
				sh $IRD/is-forward-to.sh
				;;
			25 ) 
				echo "nhap user"
				read user
				sh $IRD/is-forward-from.sh
				;;
			26 ) 
				echo "nhap user"
				read user
				sh $IRD/disable-mail-forwarding.sh
				;;
			27 ) 
				echo "nhap user"
				read user
				sh $IRD/update-domain-quota.sh
				;;
			28 ) 
				echo "nhap user"
				read user
				sh $IRD/enable-domain.sh
				;;
			29 ) 
				echo "nhap user"
				read user
				sh $IRD/disable-domain.sh
				;;
			30 ) 
				echo "nhap user"
				read user
				sh $IRD/	list-top-10-mailbox.sh	
				;;
			31 ) 
				echo "nhap user"
				read user
				sh $IRD/list-largest-to-smallest-mailbox.sh
				;;
			32 ) 
				echo "nhap user"
				read user
				sh $IRD/update-storagenode.sh
				;;

			33 ) 
				echo "nhap user"
				read user
				sh $IRD/update-storagebasedirectory.sh
				;;
			34 ) exit 0;;

				*) echo -e "${RED}Error...${STD}" && sleep 2
		esac
	}
 
		trap '' SIGINT SIGQUIT SIGTSTP
 
	 while true
	 do
 
		show_menus
	 	read_options
	 done