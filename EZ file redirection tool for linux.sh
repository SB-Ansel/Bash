#!/bin/bash
# EZ file redirection tool for Linux
#functions
INPUT=/tmp/menu.sh.$$
OUTPUT=/tmp/output.sh.$$
# get text editor or fall back to vi_editor
vi_editor=${EDITOR-vi}
# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM
function display_output(){
        local h=${1-10}         # box height default 10
        local w=${2-41}         # box width default 41
        local t=${3-Output}     # box title
        dialog --backtitle "EZ file redirection agent" --title "${t}" --clear --msgbox
}
function Open_Named_Local(){
        nano /etc/bind/named.conf.local
}
function Open_Named_Options(){
        nano /etc/bind/named.conf.options
}
function Open_Zone_File(){
        nano /etc/bind/zones/cheese.db
}
function BIND9_Service_Status(){
        output=$(OUTPUT)
        service bind9 status | grep -i running > "$OUTPUT"
        dialog --backtitle "EZ file redirection agent" --title "BIND9 Service Status" --textbox "$OUTPUT" 0 0
        #service bind9 status | grep -i running
}
function BIND9_Configuration_Check(){
        output=$(OUTPUT)
        named-checkzone cheese.pingu.me.uk /etc/bind/zones/cheese.db | less  > "$OUTPUT"
        dialog --backtitle "EZ file redirection agent" --title "BIND9 Configuration Check" --textbox "$OUTPUT" 0 0
}
# infinite loop
while true
do
dialog --clear --nocancel --backtitle "EZ file redirection agent" \
--title "[Main Menu]" \
--menu "You can use the UP/DOWN arrow keys\n\
Choose the TASK" 15 100 0 \
Open.Named.Local "Opens named.conf.local in nano." \
Open.Named.Options "Opens named.conf.options in nano." \
Open.Zone.File "Opens file cheese.db in nano." \
Check.BIND.Services "Check to see if BIND9 is running." \
Check.BIND.Configuration "Runs a check to see if BIND9 is configured correctly." \
Exit "Exits agent." 2>"${INPUT}"

menuitem=$(<"${INPUT}")

case $menuitem in
        Open.Named.Local) Open_Named_Local;;
        Open.Named.Options) Open_Named_Options;;
        Open.Zone.File) Open_Zone_File;;
        Check.BIND.Services) BIND9_Service_Status;;
        Check.BIND.Configuration) BIND9_Configuration_Check;;
        Exit) echo "Goodbye Anon! and thank you for using EZ File redirection agent!";break;;
esac

done
# if temp files found, delete em
[ -f $OUTPUT ] && rm $OUTPUT #Bam - "Why not have your output files routed to dev/null...", Jake - "Because Bam! this is cooler"
[ -f $INPUT ] && rm $INPUT





