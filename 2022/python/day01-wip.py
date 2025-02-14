#!/usr/bin/env python3

import sys

src_file = "./../day01-data"
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
    # print(f"Elf {tmp_elf} has {calories} calories.")
    if calories > max_calories:
        max_calories = calories
        elf = tmp_elf

print(f"Elf {elf} has the most calories {max_calories}")
