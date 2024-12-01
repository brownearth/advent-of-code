#!/bin/bash
cat input.txt | tr -s " " | cut -d" " -f1 | sort -n  > list1
cat input.txt | tr -s " " | cut -d" " -f2 | sort -n  > list2
total=0
while read line1; do
#    echo "File 1: $line1"
    cnt=$(grep $line1 list2 | wc -l | sed 's/[[:space:]]//g')
    
    if [ "$cnt" != "0" ]; then
        #echo "$line1 occurs $cnt times"
        addme=$(($line1 * $cnt))
        total=$(($total + $addme))
        #echo $addme
    fi
done < list1
echo $total
