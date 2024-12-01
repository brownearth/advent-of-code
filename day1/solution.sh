#!/bin/bash
cat input.txt | tr -s " " | cut -d" " -f1 | sort -n  > list1
cat input.txt | tr -s " " | cut -d" " -f2 | sort -n  > list2
total=0
while read line1 && read line2 <&3; do
    #echo "File 1: $line1"
    #echo "File 2: $line2"
    diff=$((line1 - line2))
    distance=${diff#-}
    total=$((total + distance))
done < list1 3< list2
echo $total
