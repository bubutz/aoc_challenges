#!/bin/bash

# Each rucksack has two large compartments. All items of a given type are meant
# to go into exactly one of the two compartments. 
# The Elf that did the packing failed to follow this rule for exactly one item
# type per rucksack.
#
# Every item type is identified by a single lowercase or uppercase letter (that
# is, a and A refer to different types of items).
#
# The list of items for each rucksack is given as characters all on a single line.
# A given rucksack always has the same number of items in each of its two
# compartments, so the first half of the characters represent items in the first
# compartment, while the second half of the characters represent items in the
# second compartment.
#
# For example, suppose you have the following list of contents from six rucksacks:
#
# ---
# vJrwpWtwJgWrhcsFMMfFFhFp
# jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
# PmmdzqPrVvPwwTWBwg
# wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
# ttgJtRGJQctTZtZT
# CrZsJsPPZsGzwwsLwLmpwMDw
# ---
#
# - The first rucksack contains the items vJrwpWtwJgWrhcsFMMfFFhFp, which means
#   its first compartment contains the items vJrwpWtwJgWr, while the second
#   compartment contains the items hcsFMMfFFhFp. The only item type that appears
#   in both compartments is lowercase p.
# - The second rucksack's compartments contain jqHRNqRjqzjGDLGL and
#   rsFMfFZSrLrFZsSL. The only item type that appears in both compartments is
#   uppercase L.
# - The third rucksack's compartments contain PmmdzqPrV and vPwwTWBwg;
#   the only common item type is uppercase P.
# - The fourth rucksack's compartments only share item type v.
# - The fifth rucksack's compartments only share item type t.
# - The sixth rucksack's compartments only share item type s.
#
# To help prioritize item rearrangement, every item type can be converted to a
# priority:
# - Lowercase item types a through z have priorities 1 through 26.
# - Uppercase item types A through Z have priorities 27 through 52.
#
# In the above example, the priority of the item type that appears in both
# compartments of each rucksack is 16 (p), 38 (L), 42 (P), 22 (v), 20 (t), and
# 19 (s); the sum of these is 157.
#
# ___ Part 2 ________________________________________________________
#
# The Elves are divided into groups of three. Every Elf carries a badge that
# identifies their group.
# The badge is the only item type carried by all three Elves.
# That is, if a group's badge is item type B, then all three Elves will have item
# type B somewhere in their rucksack, and at most two of the Elves will be
# carrying any other item type.
#
# The only way to tell which item type is the right one is by finding the one
# item type that is common between all three Elves in each group.
# Every set of three lines in your list corresponds to a single group, but each
# group can have a different badge item type.
# So, in the above example, the first group's rucksacks are the first three lines:
#
# ---
# vJrwpWtwJgWrhcsFMMfFFhFp
# jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
# PmmdzqPrVvPwwTWBwg
# ---
#
# And the second group's rucksacks are the next three lines:
#
# ---
# wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
# ttgJtRGJQctTZtZT
# CrZsJsPPZsGzwwsLwLmpwMDw
# ---
#
# In the first group, the only item type that appears in all three rucksacks is
# lowercase r; this must be their badges. 
# In the second group, their badge item type must be Z.


# split the line into 2 equal half
# loop through string character element in both array if same element exist
# sum the element that appears in both array, for a=1 and z=26, A=27 and Z=52

# a="abcdefghijkl"
# a_len=$(( ${#a} ))
# a_len_half=$(( $a_len / 2 ))
# echo ${a:0:$a_len}
# echo ${a:$a_len}
# for i in $(seq 0 $((${#a} - 1))); do
#     echo do something $i ${a:$i:1}
# done

update_priority() {
    # possible to use ascii bit representation??
    case $dupp in
        a) priorities=$((priorities + 1));;
        b) priorities=$((priorities + 2));;
        c) priorities=$((priorities + 3));;
        d) priorities=$((priorities + 4));;
        e) priorities=$((priorities + 5));;
        f) priorities=$((priorities + 6));;
        g) priorities=$((priorities + 7));;
        h) priorities=$((priorities + 8));;
        i) priorities=$((priorities + 9));;
        j) priorities=$((priorities + 10));;
        k) priorities=$((priorities + 11));;
        l) priorities=$((priorities + 12));;
        m) priorities=$((priorities + 13));;
        n) priorities=$((priorities + 14));;
        o) priorities=$((priorities + 15));;
        p) priorities=$((priorities + 16));;
        q) priorities=$((priorities + 17));;
        r) priorities=$((priorities + 18));;
        s) priorities=$((priorities + 19));;
        t) priorities=$((priorities + 20));;
        u) priorities=$((priorities + 21));;
        v) priorities=$((priorities + 22));;
        w) priorities=$((priorities + 23));;
        x) priorities=$((priorities + 24));;
        y) priorities=$((priorities + 25));;
        z) priorities=$((priorities + 26));;
        A) priorities=$((priorities + 27));;
        B) priorities=$((priorities + 28));;
        C) priorities=$((priorities + 29));;
        D) priorities=$((priorities + 30));;
        E) priorities=$((priorities + 31));;
        F) priorities=$((priorities + 32));;
        G) priorities=$((priorities + 33));;
        H) priorities=$((priorities + 34));;
        I) priorities=$((priorities + 35));;
        J) priorities=$((priorities + 36));;
        K) priorities=$((priorities + 37));;
        L) priorities=$((priorities + 38));;
        M) priorities=$((priorities + 39));;
        N) priorities=$((priorities + 40));;
        O) priorities=$((priorities + 41));;
        P) priorities=$((priorities + 42));;
        Q) priorities=$((priorities + 43));;
        R) priorities=$((priorities + 44));;
        S) priorities=$((priorities + 45));;
        T) priorities=$((priorities + 46));;
        U) priorities=$((priorities + 47));;
        V) priorities=$((priorities + 48));;
        W) priorities=$((priorities + 49));;
        X) priorities=$((priorities + 50));;
        Y) priorities=$((priorities + 51));;
        Z) priorities=$((priorities + 52));;
        *) echo You should be able to reach here. KABOOOMMM
            exit 3
            ;;
    esac
}

unsorted=( $(cat ./day03-data) )

left_compartment=()
right_compartment=()

for i in ${unsorted[@]}; do
    i_len_half=$(( ${#i} / 2 ))
    left_compartment+=( "${i:0:$i_len_half}" )
    right_compartment+=( "${i:$i_len_half}" )
done
unset i

left_compartment_size="${#left_compartment[@]}"
right_compartment_size="${#right_compartment[@]}"


if [[ "$left_compartment_size" != "$right_compartment_size" ]]; then
    echo Hey something wrong for both left and right compartment the amount of sacks is different
    echo left:  size: $left_compartment_size :: ${left_compartment[@]}
    echo right: size: $right_compartment_size :: ${right_compartment[@]}
    exit 1
fi

priorities=0
compartment_size=$((${#left_compartment[@]} - 1))
for compartment_idx in $(seq 0 $compartment_size); do
    left_sack=${left_compartment[$compartment_idx]}
    right_sack=${right_compartment[$compartment_idx]}
    if [[ "${#left_sack}" != "${#right_sack}" ]]; then
        echo Something wronggggg. both sack size at index $compartment_idx is different.
        exit 2
    fi
    sack_size=$((${#left_sack} - 1))
    for left_sack_idx in $(seq 0 $sack_size); do
        left_sack_content=${left_sack:$left_sack_idx:1}
        for right_sack_idx in $(seq 0 $sack_size); do
            right_sack_content=${right_sack:$right_sack_idx:1}
            if [[ $left_sack_content == $right_sack_content ]] && [[ $left_sack_content != $dupp ]]; then
                dupp=$left_sack_content
            fi
        done
    done
    update_priority
    dupp=""
done

printf "Part 1 priority is %s\n" "$priorities"
dupp=""
priorities=0

# ___ Part 2 _________________________________________
unsorted_size=$((${#unsorted[@]} - 1))
#echo $unsorted_size
#echo ${unsorted[0]}
#echo ${unsorted[$unsorted_size]}

grouping=()
for sack in ${unsorted[@]}; do
    grouping+=( "$sack" )
    if [[ ${#grouping[@]} -ge 3 ]]; then
        sack1=${grouping[0]}
        sack1_unique=( $(for tmpi in $(seq 0 $((${#sack1} - 1))); do echo ${sack1:$tmpi:1}; done | sort -u) )
        sack1_item=""
        sack2=${grouping[1]}
        sack2_unique=( $(for tmpj in $(seq 0 $((${#sack2} - 1))); do echo ${sack2:$tmpj:1}; done | sort -u) )
        sack2_item=""
        sack3=${grouping[2]}
        sack3_unique=( $(for tmpk in $(seq 0 $((${#sack3} - 1))); do echo ${sack3:$tmpk:1}; done | sort -u) )
        sack3_item=""
        for i in ${sack1_unique[@]}; do
            sack1_item=$i
            for j in ${sack2_unique[@]}; do
                sack2_item=$j
                if [[ "$sack1_item" == "$sack2_item" ]]; then
                    for k in ${sack3_unique[@]}; do
                        sack3_item=$k
                        if [[ "$sack1_item" == "$sack3_item" ]] && [[ "$sack1_item" != "$dupp" ]]; then
                            dupp=$sack1_item
                            break
                        fi
                    done
                fi
                if [[ ! -z $dupp ]]; then break; fi
            done      
            if [[ ! -z $dupp ]]; then break; fi
        done
        if [[ ! -z $dupp ]]; then
            update_priority
            dupp=""
            grouping=()
        fi
    fi
done

printf "Part 2 priority is %s\n" "$priorities"

