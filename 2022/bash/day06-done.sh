#!/bin/bash

src_file=./day06-data
incoming=$(cat $src_file)

unique1=0
unique2=0
found_pos1=0
found_pos2=0

for ((i = 0; i < ${#incoming}; i++)); do
    if [[ $((i + 4)) -lt ${#incoming} ]] && [[ $found_pos1 -eq 0 ]]; then
        unique1=$(echo ${incoming:$i:4} | sed 's/\([a-z]\)/\1 /g;s/ $//' | tr ' ' '\n' | sort -u | wc -l)
        if [[ $unique1 -eq 4 ]]; then
            found_pos1=$((i + 4))
        fi
    fi

    if [[ $((i + 14)) -lt ${#incoming} ]] && [[ $found_pos2 -eq 0 ]]; then
        unique2=$(echo ${incoming:$i:14} | sed 's/\([a-z]\)/\1 /g;s/ $//' | tr ' ' '\n' | sort -u | wc -l)
        if [[ $unique2 -ge 14 ]]; then
            found_pos2=$((i + 14))
        fi
    fi

    if [[ $found_pos1 -ne 0 ]] && [[ $found_pos2 -ne 0 ]]; then
        break
    fi
done

echo "Part 1 - First marker after character $found_pos1"
echo "Part 2 - Start of message after character $found_pos2"
