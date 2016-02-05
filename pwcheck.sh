#!/bin/bash
#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

#Your code here
SCORE=0
PASSWORD=$1
if [ $# -lt 1 ]; then
  echo "Error: Please enter a password"
fi
if [ ${#PASSWORD} -lt 6 ]; then
  echo "Error: Password length invalid"
elif [ ${#PASSWORD} -gt 32 ]; then
  echo "Error: Password length invalid."
else 
  let SCORE=32-{#PASSWORD}
fi

echo $SCORE

