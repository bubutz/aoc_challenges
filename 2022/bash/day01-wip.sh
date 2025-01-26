#!/bin/bash

# https://adventofcode.com/2022/day/1
#
#
# The Elves take turns writing down the number of Calories contained by the various meals, snacks, rations, etc. that they've brought with them, one item per line. Each Elf separates their own inventory from the previous Elf's inventory (if any) by a blank line.
#
# For example, suppose the Elves finish writing their items' Calories and end up with the following list:
#
# 1000
# 2000
# 3000
#
# 4000
#
# 5000
# 6000
#
# 7000
# 8000
# 9000
#
# 10000
#
# This list represents the Calories of the food carried by five Elves:
# - The first Elf is carrying food with 1000, 2000, and 3000 Calories, a total of 6000 Calories.
# - The second Elf is carrying one food item with 4000 Calories.
# - The third Elf is carrying food with 5000 and 6000 Calories, a total of 11000 Calories.
# - The fourth Elf is carrying food with 7000, 8000, and 9000 Calories, a total of 24000 Calories.
# - The fifth Elf is carrying one food item with 10000 Calories.
#
# In case the Elves get hungry and need extra snacks, they need to know which Elf to ask: they'd like to know how many Calories are being carried by the Elf carrying the most Calories. In the example above, this is 24000 (carried by the fourth Elf).
#
# Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?
#
# ___ Part 2 _____________________________________________________
# 

src_data=./day01-data
elf_calory_sum_arr=()
tmp_sum=0

while read value; do
    #echo $value
    case $value in
        [1-9]*) tmp_sum=$((tmp_sum + $value))
            ;;
        '') elf_calory_sum_arr+=( ${tmp_sum} )
            tmp_sum=0
            ;;
        *) echo $value you should not be able to reach here, something is wrong ;;
    esac 
done < $src_data

# This is to handle edge case
if [[ $tmp_sum -gt 0 ]]; then
    elf_calory_sum_arr+=( ${tmp_sum} )
    unset tmp_sum
fi

max_elf=0
max_calories=0
for i in "${!elf_calory_sum_arr[@]}"; do
    #echo "Elf $((i + 1)) has ${elf_calory_sum_arr[$i]} calories."
    if [[ ${elf_calory_sum_arr[$i]} -gt $max_calories ]]; then
        max_elf=$((i + 1))
        max_calories=${elf_calory_sum_arr[$i]}
    fi
done

echo Part 1: Elf $max_elf has the most calories $max_calories


top3=$(echo ${elf_calory_sum_arr[@]} | tr ' ' '\n' | sort -nr | head -3 | awk '{s+=$1}END{print s}')
echo Part 2: Top 3 elves have $top3
