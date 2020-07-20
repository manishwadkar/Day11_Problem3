#!/bin/bash

echo "Welcome to flip Coin Combination"

echo "Flipping coin one time"

result=$(($(($RANDOM%10))%2))
if [ $result -eq 1 ]
then
	echo "Heads Won"
else
	echo "Tails Won"
fi
