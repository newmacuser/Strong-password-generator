#!/bin/bash
echo "Please enter your password recovery key:"
read reckeyb
reckey=$(echo $reckeyb | base64 -d)
echo "Please enter the web/app name (e.g., apple.com):"
read app
echo "Please enter your user name:"
read username
name=$app": "$username
echo "Your input name is: \""$app": "$username\"
rec0=$(echo $reckey | sed -r 's/(.*)-/\1 /')
read -a recarr <<< $rec0
recoveruuid1=$(echo ${recarr[0]})
res=$(echo ${recarr[1]})
nums=($(echo $res | tr ":" "\n"))
reccap=$(echo ${nums[0]})
recnum1=$(echo ${nums[1]})
recnum2=$(echo ${nums[2]})
recnum3=$(echo ${nums[3]})
twonums=$(echo ${nums[4]})
recnum4=$(echo ${twonums:0:1})
recnum5=$(echo ${twonums:1:1})
recnum6=$(echo ${nums[5]})

uuid5=$(uuidgen --sha1 -n $recoveruuid1 -N "$name")
strarr=($(echo $uuid5 | tr "-" "\n"))
symbols=("!" "@" "#" "$" "%" "^" "&" "(" ")" "[" "]" "~" "+" "," ">" "<" "_" "?" "-" "=" ":" ";")
size=${#symbols[@]}
tmps0=$(echo ${strarr[0]} | sed -r "s/(.{$recnum4})/\1${symbols[$recnum1]}/")
tmps1=$(echo $tmps0 | sed -r "s/(.{$recnum5})/\1${symbols[$recnum2]}/")
tmps2=$(echo $tmps1 | sed -r "s/(.{10})/\1${symbols[$recnum3]}/")
tmps3=$(echo $tmps2 | sed -r "s/(.{$recnum6})/\1$reccap/")
pswd0=$tmps3${strarr[3]^^}
echo
echo "Here is your password for \"$name\": "$pswd0
