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
doublet=(HH TT HT TH)
triplet=(HHH HHT HTT TTT TTH THH THT HTH)

for key in ${singlet[@]}
do
        flipcoin[$key]=0
done

for key in ${doublet[@]}
do
        flipcoin[$key]=0
done

for key in ${triplet[@]}
do
        flipcoin[$key]=0
done

for((i=0;i<100;i++))
do
        res=$((RANDOM%2))
        flipcoin[${singlet[$res]}]=$((${flipcoin[${singlet[$res]}]}+1))
done

echo "Singlet Combination"
echo "Percentage of H: " $((${flipcoin[H]}*100/100))
echo "Percentage of T: " $((${flipcoin[T]}*100/100))

for((i=0;i<100;i++))
do
        res1=$((RANDOM%4))
        flipcoin[${doublet[$res1]}]=$((${flipcoin[${doublet[$res1]}]}+1))
done

echo "Doublet Combination"
echo "Percentage of HH" $((${flipcoin[HH]}*100/100))
echo "Percentage of TT" $((${flipcoin[TT]}*100/100))
echo "Percentage of HT" $((${flipcoin[HT]}*100/100))
echo "Percentage of TH" $((${flipcoin[TH]}*100/100))

for((i=0;i<100;i++))
do
        res2=$((RANDOM%8))
        flipcoin[${triplet[$res2]}]=$((${flipcoin[${triplet[$res2]}]}+1))
done

echo "Triplet Combination"
echo "Percentage of HHH" $((${flipcoin[HHH]}*100/100))
echo "Percentage of HHT" $((${flipcoin[HHT]}*100/100))
echo "Percentage of HTT" $((${flipcoin[HTT]}*100/100))
echo "Percentage of TTT" $((${flipcoin[TTT]}*100/100))
echo "Percentage of TTH" $((${flipcoin[TTH]}*100/100))
echo "Percentage of THH" $((${flipcoin[THH]}*100/100))
echo "Percentage of THT" $((${flipcoin[THT]}*100/100))
echo "Percentage of HTH" $((${flipcoin[HTH]}*100/100))

