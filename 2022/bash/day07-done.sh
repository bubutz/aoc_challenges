#!/bin/bash

# $       command
# $ cd /  go back to root only occured once in the beginning
# $ cd .. go back 1 level
# dir     directories
# 1..9    file

# Use jq or yml format, yml might need to use file
#
# Use hash table, with changing key ie, root_dir1_dir2 = 987654
# create hash key root with value 0
#   if has file, add file size to {current array}
#   if has dir, add new key root_{current array} with value 0
#     if has file, dir repeat above

# declare -A testing
# a=hello; aa=100
# b=world; bb=200
#
# testing=( [$a]="$aa" )
# testing+=( [$b]="$bb" )
# for i in "${!testing[@]}"; do echo $i = ${testing[$i]}; done
# echo a $a ${testing[$a]}

### dir and ls is not required, 
#     can use CD_dirname as a trigger to create new entry 
#     and use [0-9] as trigger for file size

#for a in ${all_commands[@]}; do echo $a; done
#for b in ${all_commands[@]}; do echo $b; done | wc -l
#for c in ${all_commands[@]}; do if [[ $c =~ ^(CD|LS|GOUP) ]]; then echo $c; fi; done
#for d in ${all_commands[@]}; do if [[ $d =~ ^(CD|LS|GOUP) ]]; then echo $d; fi; done | wc -l
#for e in ${all_commands[@]}; do if [[ $e =~ ^(LS|GOUP)$ ]]; then echo $e; fi; done | wc -l
#for f in ${all_commands[@]}; do if [[ $f =~ ^(CD|LS|GOUP)$ ]]; then echo $f; fi; done | wc -l
#for g in ${all_commands[@]}; do if [[ $g =~ ^dir_ ]]; then echo $g; fi; done
#for h in ${all_commands[@]}; do if [[ $h =~ ^dir_ ]]; then echo $h; fi; done | wc -l
#for i in ${all_commands[@]}; do if [[ $i =~ ^[[:digit:]] ]]; then echo $i; fi; done
#for j in ${all_commands[@]}; do if [[ $j =~ ^[[:digit:]] ]]; then echo $j; fi; done | wc -l


#echo root ${dirs_size[root]}; k=100; dirs_size[root]=$((${dirs_size[root]} + $k)); echo root ${dirs_size[root]}



#    if   [[ $ele1 =~ ^CD ]];      then echo "cd   $ele1 $ele2"
#    elif [[ $ele1 =~ ^GOUP ]];    then echo "goup $ele1"
#    elif [[ $ele1 =~ ^[1-9].* ]]; then echo "num  $ele2 $ele1"
#                                  else echo "FAIL $action"; fi

all_commands=( $(cat day07-data | grep -E -v '^\$ (cd /|ls)|^dir' | 
    sed 's/^\$ cd /CD_/;s/^\$ ls *$/LS/;s/CD_\.\./GOUP/;s/ /_/g' | 
    while read line; do echo $line; done) )

declare -A dirs_size
dirs_size=( [root]=0 )

current=root
for action in ${all_commands[@]}; do
    ele1=$(echo $action | awk -F_ '{print $1}')
    ele2=$(echo $action | awk -F_ '{print $2}')
    case "$ele1" in
        CD*)
            current="${current}_${ele2}"
            dirs_size+=( ["${current}"]=0 )
            ;;
        GOUP)
            current=${current%_*}
            ;;
        [1-9]*)
            dir_len=$(echo $current | awk -F_ '{print NF}')
            tmp_dir=$current
            for i in $(seq 1 $dir_len); do
                dirs_size[$tmp_dir]=$((${dirs_size[$tmp_dir]} + $ele1))
                tmp_dir=${tmp_dir%_*}
            done
            ;;
        *)  echo "FAIL $action"
            ;;
    esac
done

total_size=0
for i in ${!dirs_size[@]}; do 
    #echo "$i = ${dirs_size[$i]}"
    if [[ ${dirs_size[$i]} -lt 100000 ]]; then
        total_size=$((total_size + ${dirs_size[$i]}))
    fi
done
echo Part 1 - result is $total_size

# let say free size 700, usage 500, require 300
required_space=$((${dirs_size[root]} + 30000000 - 70000000))

dir_todelete=$(for j in ${!dirs_size[@]}; do 
    if [[ ${dirs_size[$j]} -gt $required_space ]]; then
        echo "${dirs_size[$j]}"
    fi
done | sort -n | awk 'NR==1 {print $0}')
echo Part 2 - result is $dir_todelete



