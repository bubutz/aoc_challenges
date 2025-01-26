#!/bin/bash

# 123456
# 223456
# 323456
# 423456
# 523456
# 623456

# w = 6, h = 6
# perimeter = w x 2 + h x 2 -4 corners
# Start index 2,2 , end index w-1, h-1
# Array index 1,1 and w-2, h-2

#  i,j
# (0,0) (0,1) (0,2) (0,3) (0,4)
# (1,0) (1,1) (1,2) (1,3) (1,4)
# (2,0) (2,1) (2,2) (2,3) (2,4)
# (3,0) (3,1) (3,2) (3,3) (3,4)
# (4,0) (4,1) (4,2) (4,3) (4,4)
#
# ${forest[$i]:$j:1}

#for ((row = 1; row < $((forest_height - 1)); row++)); do
#    for ((column = 1; column < $((forest_width -1)); column++)); do
#        # compare i top row
#        for ((top = 0; top < $row; top++)); do
#            if [[ $top == $row ]]; then continue; fi
#        done
#        # compare i below row
#        for ((bottom = $((row + 1)); bottom < $forest_height; bottom++)); do
#            if [[ $bottom == $row ]]; then continue; fi
#        done
#        # compare j left column
#        for ((left = 0; left < $column; left++)); do
#            if [[ $left == $column ]]; then continue; fi
#        done
#        # compare j right column
#        for ((right = $((column + 1)); n < $forest_width; right++)); do
#            if [[ $right == $column ]]; then continue; fi
#        done
#    done
#done 


src_file=day08-data

forest=( $(cat $src_file) )
forest_height=${#forest[@]}
forest_width=${#forest[0]}

visible_trees=0
total_visible=0
for ((row = 0; row < $forest_height; row++)); do
    for ((column = 0; column < $forest_width; column++)); do
        current=${forest[$row]:$column:1}
        blocked=0
        top_visible=0
        bottom_visible=0
        left_visible=0
        right_visible=0
        tmp_visible=0
        # all edges consider as visible
        if [[ $row = 0 ]] || [[ $row = $(($forest_height - 1)) ]] ||
            [[ $column = 0 ]] || [[ $column = $(($forest_width - 1)) ]]; then
            visible_trees=$((visible_trees + 1))
            continue
        fi
        # check row top
        for ((top = row - 1; top >= 0; top--)); do
            if [[ $current -le ${forest[$top]:$column:1} ]]; then
                top_visible=$((row - top))
                blocked=$((blocked + 1))
                break
            fi
            top_visible=$row
        done
        # check row bottom
        for ((bottom = row + 1; bottom < forest_height; bottom++)); do
            if [[ $current -le ${forest[$bottom]:$column:1} ]]; then
                bottom_visible=$((bottom - row))
                blocked=$((blocked + 1))
                break
            fi
            bottom_visible=$((forest_height - 1 - row))
        done
        # check column left
        for ((left = column - 1; left >= 0; left--)); do
            if [[ $current -le ${forest[$row]:$left:1} ]]; then
                left_visible=$((column - left + 1))
                blocked=$((blocked + 1))
                break
            fi
            left_visible=$column
        done
        # check column right
        for ((right = column + 1; right < forest_height; right++)); do
            if [[ $current -le ${forest[$row]:$right:1} ]]; then
                right_visible=$((right - 1 - column))
                blocked=$((blocked + 1))
                break
            fi
            right_visible=$((forest_width - 1 - column))
        done
        if [[ $blocked -lt 4 ]]; then
            visible_trees=$((visible_trees + 1))
        fi
        tmp_visible=$((top_visible * bottom_visible * left_visible * right_visible))
        if [[ $tmp_visible -gt $total_visible ]]; then
            total_visible=$tmp_visible
        fi
    done
done
echo Part 1: visible trees $visible_trees
echo Part 2: total visible tree $total_visible
