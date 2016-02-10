#!/bin/bash
#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

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
	let SCORE=$PWLEN-5

	echo $1 > password.txt
	PW=$(egrep [0-9][0-9][0-9] password.txt)
	#found 3 consecutive numbers"
	if [ ${#PW} -gt 0 ]; then
		let SCORE=$SCORE-3
	fi
	PW=$(egrep [a-z][a-z][a-z] password.txt)
	#found 3 consecutive lowercase letters
	if [ ${#PW} -gt 0 ]; then
		let SCORE=$SCORE-3
	fi
	PW=$(egrep [A-Z][A-Z][A-Z] password.txt)
	#found 3 consecutive uppercase letters
	if [ ${#PW} -gt 0 ]; then
		let SCORE=$SCORE-3
	fi
	PW=$(egrep [0-9] password.txt)
	#has at least one number
	if [ ${#PW} -gt 0  ]; then
		let SCORE=$SCORE+5
	fi
	#has at least one capital letter
	PW=$(egrep [A-Z] password.txt)
	if [ ${#PW} -gt 0 ]; then
		let SCORE=$SCORE+5
	fi
	#has at least one alphabetical character
	PW=$(egrep [A-Za-z] password.txt)
	if [ ${#PW} -gt 0 ]; then
		let SCORE=$SCORE+5
	fi
	#has at least one special character
	PW=$(egrep [#$\+%@] password.txt)
	if [ ${#PW} -gt 0 ]; then
		let SCORE=$SCORE+5
	fi
	#has consecutive identical characters
	PW=$(egrep "([0-9])\1+" password.txt)
	PWA=$(egrep "([a-z])\1+" password.txt)
	PWB=$(egrep "([A-Z])\1+" password.txt)

	if [ ${#PW} -gt 0 ] || [ ${#PWA} -gt 0 ] || [ ${#PWB} -gt 0 ]; then
		let SCORE=$SCORE-10
	fi
	echo "Password score: $SCORE"
fi
