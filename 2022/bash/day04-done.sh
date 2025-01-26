#!/bin/bash

# Every section has a unique ID number, and each Elf is assigned a range of section IDs.
# Some of the Elves compare their section assignments with each other, they've noticed
# that many of the assignments overlap.
#
# The Elves pair up and make a big list of the section assignments for each pair.
# For example, consider the following list of section assignment pairs:
#
# ---
# 2-4,6-8
# 2-3,4-5
# 5-7,7-9
# 2-8,3-7
# 6-6,4-6
# 2-6,4-8
#
# For the first few pairs, this list means:
#
#  - Within the first pair of Elves, the first Elf was assigned sections 2-4 (sections 2, 3, and 4),
#    while the second Elf was assigned sections 6-8 (sections 6, 7, 8).
#  - The Elves in the second pair were each assigned two sections.
#  - The Elves in the third pair were each assigned three sections: one got sections 5, 6, and 7,
#    while the other also got 7, plus 8 and 9.
#
# Visually, these pairs of section assignments look like this:
# 
# ---
# .234.....  2-4
# .....678.  6-8
#
# .23......  2-3
# ...45....  4-5
#
# ....567..  5-7
# ......789  7-9
#
# .2345678.  2-8
# ..34567..  3-7
#
# .....6...  6-6
# ...456...  4-6
#
# .23456...  2-6
# ...45678.  4-8
#
# 2-8 fully contains 3-7, and 6-6 is fully contained by 4-6.
# In this example, there are 2 such pairs.
#
#
# ___ PART 2 _______________________________________________________
#
#  Elves would like to know the number of pairs that overlap at all.
#
# In the above example, the first two pairs (2-4,6-8 and 2-3,4-5) don't overlap.
# While the remaining four pairs (5-7,7-9, 2-8,3-7, 6-6,4-6, and 2-6,4-8) do overlap:
#
#  - 5-7,7-9 overlaps in a single section, 7.
#  - 2-8,3-7 overlaps all of the sections 3 through 7.
#  - 6-6,4-6 overlaps in a single section, 6.
#  - 2-6,4-8 overlaps in sections 4, 5, and 6.
#
# So, in this example, the number of overlapping assignment pairs is 4.





src_file="./day04-data"
whole_set=( $(cat $src_file) )
pairs=0

for asg in ${whole_set[@]}; do
    #Instead of awk, can we walk the string and assign?
    asg11=$(echo $asg | awk -F, '{print $1}' | awk -F- '{print $1}')
    asg12=$(echo $asg | awk -F, '{print $1}' | awk -F- '{print $2}')
    asg21=$(echo $asg | awk -F, '{print $2}' | awk -F- '{print $1}')
    asg22=$(echo $asg | awk -F, '{print $2}' | awk -F- '{print $2}')
    if   [[ $asg11 -ge $asg21 ]] && [[ $asg11 -le $asg22 ]] && [[ $asg12 -ge $asg21 ]] && [[ $asg12 -le $asg22 ]]
        then pairs=$((pairs + 1))
    elif [[ $asg21 -ge $asg11 ]] && [[ $asg21 -le $asg12 ]] && [[ $asg22 -ge $asg11 ]] && [[ $asg22 -le $asg12 ]]
        then pairs=$((pairs + 1))
    fi
done

echo Part 1: $pairs pairs



pairs=0
for asg in ${whole_set[@]}; do
    asg11=$(echo $asg | awk -F, '{print $1}' | awk -F- '{print $1}')
    asg12=$(echo $asg | awk -F, '{print $1}' | awk -F- '{print $2}')
    asg21=$(echo $asg | awk -F, '{print $2}' | awk -F- '{print $1}')
    asg22=$(echo $asg | awk -F, '{print $2}' | awk -F- '{print $2}')
    for content in $(seq $asg11 $asg12); do
        if [[ $content -ge $asg21 ]] && [[ $content -le $asg22 ]]; then
            pairs=$((pairs + 1))
            break
        fi
    done
done
echo Part 1: $pairs pairs

