#!/bin/bash
function HextoBase(){
    hextobase64=$(whiptail --inputbox "Enter Hex code!" 8 78 --nocancel --title "Hex to base64 to string" 3>&1 1>&2 2>&3)
    hextobase64_decoded="$(echo $hextobase64 | xxd -p -r | base64 -d)"
    whiptail --title "Decoded" --ok-button "Exit" --msgbox "$hextobase64_decoded" 8 78
}

function BasetoString(){
    base64tostring=$(whiptail --inputbox "Enter Base64 code!" 8 78 --nocancel --title "base64 to string" 3>&1 1>&2 2>&3)
    base64_decoded="$(echo $base64tostring | base64 -d)"
    echo $base64_decoded
    whiptail --title "Decoded" --ok-button "Exit" --msgbox "$base64_decoded" 8 78
}

function HextoString(){
    hextostring=$(whiptail --inputbox "Enter Hex code!" 8 78 --nocancel --title "Hex to string" 3>&1 1>&2 2>&3)
    hex_decoded="$(echo $hextostring | xxd -p -r)"
    whiptail --title "Decoded" --ok-button "Exit" --msgbox "$hex_decoded" 8 78 
}

AnselsDecoder=$(
whiptail --title "Ansels' Super Awesome Decoder" --menu "So choose an option:" --nocancel 25 78 16 \
    "<-- Exit" "Exits Agent" \
    "hex_base64" "Convert a hexdump to base64." \
    "base64" "Decode a base64 string." \
    "Hexdump" "Decode a Hexdump." 3>&2 2>&1 1>&3
)
case $AnselsDecoder in 
    "<-- Exit") echo 'exiting';;
    "hex_base64") HextoBase;;
    "base64") BasetoString;;
    "Hexdump") HextoString;;
esac
# Clean up time!
clear