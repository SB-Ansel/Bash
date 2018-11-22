#!/bin/bash
# EZ file redirection tool for Linux
#functions
INPUT=/tmp/menu.sh.$$
# Storage file for displaying cal and date command output
OUTPUT=/tmp/output.sh.$$
# get text editor or fall back to vi_editor
vi_editor=${EDITOR-vi}
# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM
function display_output(){
        local h=${1-10}         # box height default 10
        local w=${2-41}         # box width default 41
        local t=${3-Output}     # box title
        dialog --backtitle "EZ file redirection tool for Linux" --title "${t}" --clear --msgbo$
}
function named.local(){
        nano /etc/bind/named.conf.local
}

function named.options(){
        nano /etc/bind/named.conf.options
}
function open.cheese.db(){
        nano /etc/bind/zones/cheese.db
}
# infinite menu loop
while true
do
dialog --clear --help-button --backtitle "EZ file redirection tool for Linux" \
--title "[Main Menu]" \
--menu "You can use the UP/DOWN arrow keys\n\
Choose the TASK" 15 50 4 \
Local "Opens named.conf.local" \
Options "Opens named.conf.options" \
Cheese.db "Opens cheeseZone.db" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")

case $menuitem in
        Local) named.local;;
        Options) named.options;;
        Cheese.db) open.cheese.db;;
        Exit) echo "Goodbye Anon! and thankyou for using Script Tec";break;;
esac

done
# if temp files found, delete em
[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT