#!/bin/bash
SCORE=0
if [ $# -lt 1 ]; then
  echo "Error: Please enter a password"
fi
if [ ${#1} -lt 6 AND ${#1} -gt 32 ]; then
  echo "Error: Password length invalid."
else 
  $SCORE=32-${#1}
fi


#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

#Your code here
