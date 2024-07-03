#!/bin/bash
# on linux; install uuidgen with apt-get install uuid-runtime
echo "Please enter the web/app name (e.g., apple.com):"
read app
echo "Please enter your user name:"
read username
name=$app": "$username
echo "Your input name is: \""$app": "$username\"
uuid1=$(uuidgen -t)
uuid5=$(uuidgen --sha1 -n $uuid1 -N "$name")
strarr=($(echo $uuid5 | tr "-" "\n")) 
symbols=("!" "@" "#" "$" "%" "^" "&" "(" ")" "[" "]" "~" "+" "," ">" "<" "_" "?" "-" "=" ":" ";")
size=${#symbols[@]}
num1=$(( $RANDOM % size ))
num2=$(( $RANDOM % size ))
num3=$(( $RANDOM % size ))
num4=$(( $RANDOM % 4 ))
num5=$((( $RANDOM % 4 )+5))
tmps0=$(echo ${strarr[0]} | sed -r "s/(.{$num4})/\1${symbols[$num1]}/")
tmps1=$(echo $tmps0 | sed -r "s/(.{$num5})/\1${symbols[$num2]}/")
tmps2=$(echo $tmps1 | sed -r "s/(.{10})/\1${symbols[$num3]}/")
caps0=$(echo {A..Z} | tr -d ' ')
caps1=$(echo "${caps0:$(( RANDOM % ${#caps0} )):1}")
num6=$(( $RANDOM % 12 ))
tmps3=$(echo $tmps2 | sed -r "s/(.{$num6})/\1$caps1/")
pswd0=$tmps3${strarr[3]^^}
echo
echo "Your strong password is: "$pswd0
echo "Your password recovery key is: "\""$uuid1-""$caps1"":$num1"":$num2"":$num3:""$num4""$num5"":$num6"\"
echo "$uuid1-""$caps1"":$num1"":$num2"":$num3:""$num4""$num5"":$num6" > recover.key
