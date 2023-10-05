#!/bin/bash
balance=1000
pin=1234
hour=$(date +"%H")
function check_balance(){
	echo "your balance is $balance"
}
function deposit(){
	read -p "enter deposit amount:::" amount
	if [ $amount -lt 100 ];
	then
		echo "please deposit 100 above"
	else
	balance=$(( amount+balance ))
	echo "your amount deposit successfull after deposit your total balance is::: $balance"
	fi
}
function withdraw(){
	read -p "enter withdraw amount:::" amount
	if [ $amount -le $balance ];
	then
		read -p "enter your pin" enter_pin
		if [ $enter_pin == $pin ];
		then
			balance=$((balance-amount))
			echo "your withdraw successfull and new balance is $balance"
		else
			"wrong pin enter again::"
		fi
	else
		echo "no balance please deposit"
	fi
}
function main_menu(){
	if [[ ( $hour -ge 0 && $hour -lt 12 ) ]];
	then
		echo "good morning and time is $current_time"
	elif [[ ( $hour -ge 12 && $hour -le 17 ) ]];
	then
		echo "good afternoon and time is $current_time"
	elif [[ ( $hour -gt 17 && $hour -lt 20 ) ]];
	then
		echo "good evening and time is $current_time"
	else
		echo "good night and time is $current_time"
	fi
	echo "1. check_balance"
	echo "2. deposit"
	echo "3. withdraw"
	echo "4. exit"
	read -p "enter your choice" choice
	case $choice in
		1)
			check_balance ;;
		2)
			deposit ;;
		3)
			withdraw ;;
		4)
			exit ;;
		*)
			echo "please choose correct option" ;;
	esac
	main_menu
}
main_menu

