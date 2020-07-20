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
declare -A flipcoind
declare -A flipcoint
singlet=(H T)
doublet=(HH TT HT TH)
triplet=(HHH HHT HTT TTT TTH THH THT HTH)

for key in ${singlet[@]}
do
        flipcoin[$key]=0
done

for key in ${doublet[@]}
do
        flipcoind[$key]=0
done

for key in ${triplet[@]}
do
        flipcoint[$key]=0
done

for((i=0;i<100;i++))
do
        res=$((RANDOM%2))
        flipcoin[${singlet[$res]}]=$((${flipcoin[${singlet[$res]}]}+1))
done

echo "Singlet Combination"
echo "Percentage of H: " $((${flipcoin[H]}*100/100))
echo "Percentage of T: " $((${flipcoin[T]}*100/100))

max=H
for key in ${!flipcoin[@]}
do
	if [ ${flipcoin[$key]} -gt ${flipcoin[$max]} ]
	then
		max=$key
	fi
done

echo "Winning combination in singlet combination is $max :" ${flipcoin[$max]} "percentage"

for((i=0;i<100;i++))
do
        res1=$((RANDOM%4))
        flipcoind[${doublet[$res1]}]=$((${flipcoind[${doublet[$res1]}]}+1))
done

echo "Doublet Combination"
echo "Percentage of HH" $((${flipcoind[HH]}*100/100))
echo "Percentage of TT" $((${flipcoind[TT]}*100/100))
echo "Percentage of HT" $((${flipcoind[HT]}*100/100))
echo "Percentage of TH" $((${flipcoind[TH]}*100/100))

max=HH
for key in ${!flipcoind[@]}
do
	if [ ${flipcoind[$key]} -gt ${flipcoind[$max]} ]
	then
		max=$key
	fi
done

echo "Winning combination in doublet combination is $max :" ${flipcoind[$max]} "percentage"

for((i=0;i<100;i++))
do
        res2=$((RANDOM%8))
        flipcoint[${triplet[$res2]}]=$((${flipcoint[${triplet[$res2]}]}+1))
done

echo "Triplet Combination"
echo "Percentage of HHH" $((${flipcoint[HHH]}*100/100))
echo "Percentage of HHT" $((${flipcoint[HHT]}*100/100))
echo "Percentage of HTT" $((${flipcoint[HTT]}*100/100))
echo "Percentage of TTT" $((${flipcoint[TTT]}*100/100))
echo "Percentage of TTH" $((${flipcoint[TTH]}*100/100))
echo "Percentage of THH" $((${flipcoint[THH]}*100/100))
echo "Percentage of THT" $((${flipcoint[THT]}*100/100))
echo "Percentage of HTH" $((${flipcoint[HTH]}*100/100))

max=HHH
for key in ${!flipcoint[@]}
do
	if [ ${flipcoint[$key]} -gt ${flipcoint[$max]} ]
	then
		max=$key
	fi
done

echo "The Winning combination in triplet combination is $max :" ${flipcoint[$max]} "percentage"
