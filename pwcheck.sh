#!/bin/bash
#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

echo $#
#Your code here
if [ $# -lt 1 ]; then
	echo "Error: Please enter a password"
elif [ ${#1} -lt 6 ]; then
	echo "Error: Password length invalid"
elif [ ${#1} -gt 32 ]; then
	echo "Error: Password length invalid."
else
	PASSWORD=$1
	SCORE=0
	
	PWLEN=${#1}
	let SCORE=32-$PWLEN

	echo $1 > password.txt
	PW=$(egrep [0-9][0-9][0-9] password.txt)
	if [ ${#PW} -gt 0 ]; then
		echo "found 3 consecutive numbers"
		let SCORE=$SCORE-3
		echo $SCORE
	fi
	PW=$(egrep [0-9] password.txt)
	if [ ${#PW} -gt 0  ]; then
		echo "has at least one number"
		let SCORE=$SCORE+5
	fi
	PW=$(egrep [A-Z] password.txt)
	if [ ${#PW} -gt 0 ]; then
		echo "has one capital letter"
		let SCORE=$SCORE+5
	fi
fi

