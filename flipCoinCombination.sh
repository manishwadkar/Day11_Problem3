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

declare -A flipcoin
singlet=(H T)

for key in ${singlet[@]}
do
        flipcoin[$key]=0
done

for((i=0;i<100;i++))
do
        res=$((RANDOM%2))
        flipcoin[${singlet[$res]}]=$((${flipcoin[${singlet[$res]}]}+1))
done

echo "Percentage of Heads: " $((${flipcoin[H]}*100/100))
echo "Percentage of Tails: " $((${flipcoin[T]}*100/100))

