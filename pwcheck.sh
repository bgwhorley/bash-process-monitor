#!/bin/bash
#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

echo $#
#Your code here
if [ $# -lt 1 ]; then
	echo "Error: Please enter a password"
elif [ ${#PASSWORD} -lt 6 ]; then
	echo "Error: Password length invalid"
elif [ ${#PASSWORD} -gt 32 ]; then
	echo "Error: Password length invalid."
else
	PASSWORD=$1
	SCORE=0
	
	PWLEN=${#1}
	let SCORE=32-$PWLEN

	#$1 > password.txt
	egrep [0-9][0-9][0-9] $1 > $PW
	if [ {$#PW}  ]; then
		echo "something"
	fi
fi
echo $SCORE

