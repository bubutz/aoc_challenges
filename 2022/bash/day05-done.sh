#!/bin/bash

#     [D]    
# [N] [C]    
# [Z] [M] [P]
#  1   2   3 
#
# move 1 from 2 to 1
# move 3 from 1 to 3
# move 2 from 2 to 1
# move 1 from 1 to 2
#
# In this example, there are three stacks of crates. Stack 1 contains two crates: 
# crate Z is on the bottom, and crate N is on top. Stack 2 contains three crates;
# from bottom to top, they are crates M, C, and D. Finally, stack 3 contains a single crate, P.
#
# Then, the rearrangement procedure is given. In each step of the procedure,
# a quantity of crates is moved from one stack to a different stack.
# In the first step of the above rearrangement procedure, one crate is moved from stack 2 to stack 1,
# resulting in this configuration:
#
# [D]        
# [N] [C]    
# [Z] [M] [P]
#  1   2   3 
#
# In the second step, three crates are moved from stack 1 to stack 3.
# Crates are moved one at a time, so the first crate to be moved (D) ends up below the second and third crates:
#
#         [Z]
#         [N]
#     [C] [D]
#     [M] [P]
#  1   2   3
#
# Then, both crates are moved from stack 2 to stack 1.
# Again, because crates are moved one at a time, crate C ends up below crate M:
#
#         [Z]
#         [N]
# [M]     [D]
# [C]     [P]
#  1   2   3
#
# Finally, one crate is moved from stack 1 to stack 2:
#
#         [Z]
#         [N]
#         [D]
# [C] [M] [P]
#  1   2   3
#
# The Elves just need to know which crate will end up on top of each stack;
# in this example, the top crates are C in stack 1, M in stack 2, and Z in stack 3,
# so you should combine these together and give the Elves the message CMZ.

src_file="day05-data"
tmp_arr=( $(grep -E -v '^($| [1-9]|move)' $src_file | sed 's/^   /\[ \]/g;s/    / \[ \]/g;s/\[//g;s/\]//g;s/  / /g;s/\([A-Z]\) /\1/g;s/ /x/g') )
tmp_arr_len=
box_arr=()

for ((i = 0; i < ${#tmp_arr[@]}; i++)); do
    for ((j = 0; j < ${#tmp_arr[$i]}; j++)); do
        if [[ "${tmp_arr[$i]:$j:1}" != "x" ]]; then
            box_arr[$j]="${box_arr[$j]}${tmp_arr[$i]:$j:1}"
        fi
    done
done

# move [0] from [1] to [2]
moves=( $(grep -E '^move' $src_file | sed 's/^move //;s/ from /-/;s/ to /-/') )

for m in ${moves[@]}; do
    move=$(echo $m | awk -F- '{print $1}')
    from=$(($(echo $m | awk -F- '{print $2}') - 1))
    to=$(($(echo $m | awk -F- '{print $3}') - 1))
    tmp_store=""
    for ((n = 0; n < $move; n++)); do
        tmp_store=${box_arr[$from]:$n:1}$tmp_store
    done
    tmp_store=$tmp_store${box_arr[$to]}
    box_arr[$to]=$tmp_store
    box_arr[$from]=${box_arr[$from]:$move}
done

printf "Part 1 answer: "
for o in ${box_arr[@]}; do
    if [[ -z $o ]]
        then printf " "
        else printf "${o:0:1}"
    fi
done; echo


box_arr=()
for ((i = 0; i < ${#tmp_arr[@]}; i++)); do
    for ((j = 0; j < ${#tmp_arr[$i]}; j++)); do
        if [[ "${tmp_arr[$i]:$j:1}" != "x" ]]; then
            box_arr[$j]="${box_arr[$j]}${tmp_arr[$i]:$j:1}"
        fi
    done
done

move=""
from=""
to=""
for p in ${moves[@]}; do
    move=$(echo $p | awk -F- '{print $1}')
    from=$(($(echo $p | awk -F- '{print $2}') - 1))
    to=$(($(echo $p | awk -F- '{print $3}') - 1))
    tmp_store=""
    tmp_store=${box_arr[$from]:0:$move}
    tmp_store=$tmp_store${box_arr[$to]}
    box_arr[$to]=$tmp_store
    box_arr[$from]=${box_arr[$from]:$move}
done

printf "Part 2 answer: "
for t in ${box_arr[@]}; do
    if [[ -z $t ]]
        then printf " "
        else printf "${t:0:1}"
    fi
done; echo

