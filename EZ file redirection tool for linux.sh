#!/bin/bash
# EZ file redirection tool for linux

#functions
function display_output(){
	local h=${1-10}			# box height default 10
	local w=${2-41} 		# box width default 41
	local t=${3-Output} 	# box title 
	dialog --backtitle "EZ file redirection tool for linux" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}
function named.local{
	$nano /etc/bind/named.conf.local
}
function named.options{
	$nano /etc/bind/named.conf.optionss
}
function open.cheese.db{
	$nano /etc/bind/zones/cheese.db
}
# infinite loop
while true
do
dialog --clear --help-button --backtitle "EZ file redirection tool for linux" \
--title "[ M A I N - M E N U ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 15 50 4 \
.local "Opens named.conf.local" \
.options "Opens named.conf.options" \
Cheese.db "Opens cheeseZone.db" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")
# make decsion 
case $menuitem in
	.local) named.local;;
	.options) named.option;;
	cheese.db) open.cheese.db;;
	Exit) echo "Bye"; break;;s
esac
done