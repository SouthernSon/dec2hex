#!/bin/sh
#Conver a decimal value to hexadecimal.

basechar()
{
    case $1 in 
		10) echo A;;
		11) echo B;;
		12) echo C;;
		13) echo D;;
		14) echo E;;
		15) echo F;;
    esac
}

val=$1
base=16
answer=""
count=0
while [ $val -ne 0 ]; do
	result=$(( val % base ))
	if [ $result -gt 9  ]; then
		answer=$(basechar $result)$answer
    else
    	    answer=$result$answer
	fi
	val=$(( val / base ))
	count=$((count + 1))
done
##If looped odd number of time, prefix a zero to make a full byte
##This is to avoid any odd number of digits that could cause
##unwanted bytes in the final command string
echo $count
if [ $count -eq 0 ]; then	
	echo "00"
elif [ $count -eq 1 ]; then
	echo "0$answer"
elif [ $((count % 2)) -eq 1 ]; then
	echo "0$answer"
else
	echo $answer
fi
