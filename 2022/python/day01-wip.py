#!/usr/bin/env python3

# https://adventofcode.com/2022/day/1
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
# ___ Start Here _____________________________________________________

import sys

src_file = "./day01-data"
src_file_open = open(src_file, "r")
elf_calory_sum_arr = []
tmp_calory_sum = 0


for line in src_file_open:
    line = line.strip()
    if line == "":
        elf_calory_sum_arr.append(tmp_calory_sum)
        tmp_calory_sum = 0
    elif int(line) > 0:
        tmp_calory_sum = tmp_calory_sum + int(line)
    else:
        print("You should not be able to reach here")
        sys.exit(1)

# This is to catch unassigned tmp_calory_sum
if tmp_calory_sum > 0:
    elf_calory_sum_arr.append(tmp_calory_sum)

max_calories = 0
elf = 0
for i, calories in enumerate(elf_calory_sum_arr):
    tmp_elf = i + 1
    #print(f"Elf {tmp_elf} has {calories} calories.")
    if calories > max_calories:
        max_calories = calories
        elf = tmp_elf

print(f"Elf {elf} has the most calories {max_calories}")



