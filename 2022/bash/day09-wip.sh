#!/bin/bash

src_file=day09-data
mapfile actions < "$src_file"

declare -A rope0 rope1 rope9 dist_next
rope_xy=()
for i in $(seq 0 9); do rope_xy[$i]="0,0"; done; unset i
rope0_pos=( "0,0" )
#rope0=( ["x"]=0 ["y"]=0 )
rope0x=0
rope0y=0
rope1_pos=( "0,0" )
#rope1=( ["x"]=0 ["y"]=0 )
rope1x=0
rope1y=0
rope9_pos=( "0,0" )
#rope9=( ["x"]=0 ["y"]=0 )
rope9x=0
rope9y=0
next_dist=( ["x"]=0 ["y"]=0 )
next_distx=0
next_disty=0

z=0
for action in "${actions[@]}"; do
    direction=$(echo "$action" | cut -d ' ' -f1)
    move=$(echo "$action" | cut -d ' ' -f2)
    rope0x=$(echo "${rope0_pos[@]:(-1)}" | cut -d, -f1)
    rope0y=$(echo "${rope0_pos[@]:(-1)}" | cut -d, -f2)
    rope1x=$(echo "${rope1_pos[@]:(-1)}" | cut -d, -f1)
    rope1y=$(echo "${rope1_pos[@]:(-1)}" | cut -d, -f2)
    #rope9x=$(echo "${rope9_pos[@]:(-1)}" | cut -d, -f1)
    #rope9y=$(echo "${rope9_pos[@]:(-1)}" | cut -d, -f2)
    printf "  rope0     rope1   | D M |    0xy    |    1xy    | rope0   rope1 \n"
    printf "%4s,%4s %4s,%4s | " "${rope0x}" "${rope0y}" "${rope1x}" "${rope1y}"
    printf "%s%2s | " "$direction" "$move"

    for i in $(seq 1 $move); do

        case $direction in
            R)  rope0x=$((rope0x + 1)) ;;
            L)  rope0x=$((rope0x - 1)) ;;
            U)  rope0y=$((rope0y + 1)) ;;
            D)  rope0y=$((rope0y - 1)) ;;
            *) echo "___You should not be here___"; exit 1;;
        esac

        next_distx=$((rope0x - rope1x))
        next_disty=$((rope0y - rope1y))
        #printf "next %3s %3s " "${next_distx}" "${next_disty}"

        if [[ ${next_distx#-} -gt 1 ]]; then
            case $direction in
                R) rope1x=$((rope0x + 1)); rope1y=${rope0y};;
                L) rope1x=$((rope0x - 1)); rope1y=${rope0y};;
                *) echo "___You should not be here___"; exit 2;;
            esac
            rope1_pos+=( "${rope1x},${rope1y}" )

        elif [[ ${next_disty#-} -gt 1 ]]; then
            case $direction in
                U) rope1y=$((rope0y + 1)); rope1x=${rope0x};;
                D) rope1y=$((rope0y - 1)); rope1x=${rope0x};;
                *) echo "___You should not be here___"; exit 2;;
            esac
            rope1_pos+=( "${rope1x},${rope1y}" )
        fi

        rope0_pos+=( "${rope0x},${rope0y}" )
        next_distx=0
        next_disty=0

    done
    direction=""
    move=0
    unset i
    printf "%4s %4s | %4s %4s | " "${rope0x}" "${rope0y}" "${rope1x}" "${rope1y}"
    printf "%3s,%3s %3s,%3s\n\n" "${rope0x}" "${rope0y}" "${rope1x}" "${rope1y}"
#z=$((z + 1)); [[ $z = 100 ]] && break
done

tail_visited=$( for v in ${rope1_pos[@]}; do echo $v; done | sort -u | wc -l )
echo Part 1: tail total visited $tail_visited


