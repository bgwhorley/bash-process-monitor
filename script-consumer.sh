#!/bin/bash


for index in $(seq 100000); do
	value=$(awk "BEGIN {print $RANDOM * $index}")
    buffer[$index]=$value
done

