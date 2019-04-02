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
		echo "1. Tao Nguoi Dung Moi"
		echo "2. Xoa User"
		echo "3. Thay Doi Mat Khau User"
		echo "4. De-activate Tai Khoan"
		echo "5. Re-activate Tai Khoan"
		echo "6. List Cac Tai Khoan Kich Hoat "
		echo "7. List Cac Tai Khoan Chu Kich Hoat"
		echo "8. Lists all from the forwardings"
		echo "9. Kich Hoat POP3 Cho Tai Khoan"
		echo "10. Kich Hoat IMAP Cho Tai Khoan"
		echo "11. Cam Dung POP3 Cho Tai Khoan"
		echo "12. Cam Dung IMAP Cho Tai Khoan"
		echo "13. Them Dung Luong Cho Tai Khoan"
		echo "14. Tao Mail alias"
		echo "15. Them Mail alias"
		echo "16. Tao Va Cap Nhap policy "
		echo "17. Xoa Mail alias"
		echo "18. Set an alias as active"
		echo "19. Set an alias as inactive"
		echo "20. Kiem tra email co la alias hay khong"
		echo "21. Liet Ke configured forwards"
		echo "22. Xoa mail forwarding Tu Dia Chi Email"
		echo "23. Chuyen Toan BO Mail Tu User1=>User2"
		echo "24. List if any addresses are set to forward to a given address"
		echo "25. List if any addresses are set to forward from a given address"
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
				echo "Nhap tai khoan can tao"
				read user
				echo "Mat Khau Cho User"
				read mk
				sh $IRD/create-new-user.sh $user $mk
				;;

			2 ) 
				echo "Nhap Ten User@domain Cần Xóa"
				read remove
				sh $IRD/remove-user.sh $remove
				;;
			3 ) 
				echo "nhap user can updates"
				read user
				echo "Nhap Mat Khau Moi Cho $user"
				read mk
				sh $IRD/update-account-password.sh $user $mk
				;;

			4 ) 
				echo "Nhap User Can Cam Mail Forwarding Tu User"
				read user1
				echo "Nhap User Can Cam Mail Forwarding Toi User"
				read user1
				sh $IRD/disable-mail-forwarding.sh $user
				;;

			5 ) 
				echo "nhap user"
				read user
				sh $IRD/disable-mail-forwarding.sh $user
				;;
			6 ) 
				echo "nhap user"
				read user
				sh $IRD/list-active-accounts.sh $user
				;;
			7 ) 
				echo "nhap user"
				read user
				sh $IRD/list-inactive-accounts.sh $user
				;;
			8 ) 
				echo "nhap user"
				read user
				sh $IRD/list-all-but-regular-accounts.sh $user
				;;
			9 ) 
				echo "nhap user"
				read user
				sh $IRD/enable-pop3-for-user.sh $user
				;;
			10 ) 
				echo "nhap user"
				read user
				sh $IRD/enable-imap-for-user.sh $user
				;;
			11 ) 
				echo "nhap user"
				read user
				sh $IRD/disable-pop3-for-user.sh $user
				;;
			12 ) 
				echo "nhap user"
				read user
				sh $IRD/disable-imap-for-user.sh $user
				;;
			13 ) 
				echo "nhap user"
				read user
				sh $IRD/increase-mailbox-quota.sh $user
				;;
			14 ) 
				echo "nhap user"
				read user
				sh $IRD/create-alias.sh $user
				;;
			15 ) 
				echo "nhap user"
				read user
				sh $IRD/add-user-to-alias.sh $user
				;;
			16 ) 
				echo "nhap user"
				read user
				sh $IRD/create-alias-policy.sh $user
				;;
			17 ) 
				echo "nhap user"
				read user
				sh $IRD/remove-alias.sh $user
				;;
			18 ) 
				echo "nhap user"
				read user
				sh $IRD/set-alias-active.sh $user
				;;
			19 ) 
				echo "nhap user"
				read user
				sh $IRD/set-alias-inactive.sh $user
				;;
			20 ) 
				echo "nhap user"
				read user
				sh $IRD/is-address-an-alias.sh $user
				;;
			21 ) 
				echo "nhap user"
				read user
				sh $IRD/list-forwarding.sh $user
				;;
			22 ) 
				echo "nhap user"
				read user
				sh $IRD/remove-forwarding.sh $user
				;;
			23 ) 
				echo "nhap user"
				read user
				sh $IRD/add-mail-forward.sh $user
				;;
			24 ) 
				echo "nhap user"
				read user
				sh $IRD/is-forward-to.sh $user
				;;
			25 ) 
				echo "nhap user"
				read user
				sh $IRD/is-forward-from.sh $user
				;;
			26 ) 
				echo "nhap user"
				read user
				sh $IRD/disable-mail-forwarding.sh $user
				;;
			27 ) 
				echo "nhap user"
				read user
				sh $IRD/update-domain-quota.sh $user
				;;
			28 ) 
				echo "nhap user"
				read user
				sh $IRD/enable-domain.sh $user
				;;
			29 ) 
				echo "nhap user"
				read user
				sh $IRD/disable-domain.sh $user
				;;
			30 ) 
				echo "nhap user"
				read user
				sh $IRD/	list-top-10-mailbox.sh $user	
				;;
			31 ) 
				echo "nhap user"
				read user
				sh $IRD/list-largest-to-smallest-mailbox.sh $user
				;;
			32 ) 
				echo "nhap user"
				read user
				sh $IRD/update-storagenode.sh $user
				;;

			33 ) 
				echo "nhap user"
				read user
				sh $IRD/update-storagebasedirectory.sh $user
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