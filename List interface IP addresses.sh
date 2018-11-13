#!/bin/bash
cat << Main_Menu
Task :: Create a script to list the IP addresses your computer is connected to and the interface status.
1> Run Expression
2> Open in Nano
3> Exit
Main_Menu
#####################################################
function expression(){
echo "The following interfaces are in the 'up' state" #The following expression outputs interface statuses. 

ip addr | awk '
/^[0-9]+:/ {
  sub(/:/,"",$2); iface=$2 }
/^[[:space:]]*inet / {
  split($2, a, "/")
 print iface" : "a[1]
}'
}

read n #Probably could have done a while loop here so instead of ending the script after pressing one button it'll loop round and let the user choose another option, really the intended option of exit is void without the while loop. but meh
case $n in
    1) expression;;
    2) nano /home/Ansel/test2.0.sh;; #File path to this file.
    3) break;;
    *) invalid option;; #basic user validation
esac #case spelled backwards, required to end case statement.
