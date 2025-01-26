#!/bin/bash

# The first column is what your opponent is going to play: A for Rock, B for Paper, and C for Scissors...
#
# The second column, you reason, must be what you should play in response: X for Rock, Y for Paper, and Z for Scissors. Winning every time would be suspicious, so the responses must have been carefully chosen.
#
# Your total score is the sum of your scores for each round. The score for a single round is the score for the shape you selected (1 for Rock, 2 for Paper, and 3 for Scissors) plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).
#
# For example, suppose you were given the following strategy guide:
# A Y
# B X
# C Z
#
# This strategy guide predicts and recommends the following:
# - In the first round, your opponent will choose Rock (A), and you should choose Paper (Y). This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
# - In the second round, your opponent will choose Paper (B), and you should choose Rock (X). This ends in a loss for you with a score of 1 (1 + 0).
# - The third round is a draw with both players choosing Scissors, giving you a score of 3 + 3 = 6.
#
# In this example, if you were to follow the strategy guide, you would get a total score of 15 (8 + 1 + 6).
#
# What would your total score be if everything goes exactly according to your strategy guide?
#
# value
# X = 1
# Y = 2
# Z = 3
#
# combination
# A(rock)    > Z(scissor) = L0 + Z3 = 3
# A(rock)    = X(rock)    = T3 + X1 = 4
# A(rock)    < Y(paper)   = W6 + Y2 = 8
# B(paper)   > X(rock)    = L0 + X1 = 1
# B(paper)   = Y(paper)   = T3 + Y2 = 5
# B(paper)   < Z(scissor) = W6 + Z3 = 9
# C(scissor) > Y(paper)   = L0 + Y2 = 2
# C(scissor) = Z(scissor) = T3 + Z3 = 6
# C(scissor) < X(rock)    = W6 + X1 = 7
#
# ___ ROUND TWO __________________________________________________________________________
#
# - In the first round, your opponent will choose Rock (A), and you need the round to end in a draw (Y), so you also choose Rock. This gives you a score of 1 + 3 = 4.
# - In the second round, your opponent will choose Paper (B), and you choose Rock so you lose (X) with a score of 1 + 0 = 1.
# - In the third round, you will defeat your opponent's Scissors with Rock for a score of 1 + 6 = 7.
# 
# value
# X = lose
# Y = draw
# Z = win
# rock    = 1
# paper   = 2
# scissor = 3
#
# combination
# A(rock)    = X(lose) : scissor = L0 + S3 = 3
# A(rock)    < Y(draw) : rock    = T3 + R1 = 4
# A(rock)    > Z(win)  : paper   = W6 + P2 = 8
# B(paper)   > X(lose) : rock    = L0 + R1 = 1
# B(paper)   = Y(draw) : paper   = T3 + P2 = 5
# B(paper)   < Z(win)  : scissor = W6 + S3 = 9
# C(scissor) < X(lose) : paper   = L0 + P2 = 2
# C(scissor) > Y(draw) : scissor = T3 + S3 = 6
# C(scissor) = Z(win)  : rock    = W6 + R1 = 7


src_file="./day02-data"
strategy=( $(cat $src_file) ) 
opponent=""
total_score=0


printf "round 1 total score is "
for idx in "${!strategy[@]}"; do
    if [[ $(($idx % 2)) -eq 0 ]]; then
        #printf "do something ${strategy[$idx]} "
        opponent="${strategy[$idx]}"
    else
        case ${strategy[$idx]} in
            x|X) case $opponent in
                    a|A) ((total_score += 4));; #A X = 4
                    b|B) ((total_score += 1));; #B X = 1
                    c|C) ((total_score += 7));; #C X = 7
                    *) echo you should not be here, CRASH!!!!
                        exit 2;;
                esac
                ;;
            y|Y) case $opponent in
                    a|A) ((total_score += 8));; #A Y = 8
                    b|B) ((total_score += 5));; #B Y = 5
                    c|C) ((total_score += 2));; #C Y = 2
                    *) echo you should not be here, CRASH!!!!
                        exit 2;;
                esac
                ;;
            z|Z) case $opponent in
                    a|A) ((total_score += 3));; #A Z = 3
                    b|B) ((total_score += 9));; #B Z = 9
                    c|C) ((total_score += 6));; #C Z = 6
                    *) echo you should not be here, CRASH!!!!
                        exit 2;;
                esac
                ;;
            *) echo you should not be here, CRASH!!
                exit 1;;
        esac
        opponent=""
        #echo ${strategy[$idx]}
    fi
done
echo $total_score
total_score=0

printf "round 2 total score is "
for idx in "${!strategy[@]}"; do
    if [[ $(($idx % 2)) -eq 0 ]]; then
        #printf "do something ${strategy[$idx]} "
        opponent="${strategy[$idx]}"
    else
        case ${strategy[$idx]} in
            x|X) case $opponent in
                    a|A) ((total_score += 3));; #A X = 4
                    b|B) ((total_score += 1));; #B X = 1
                    c|C) ((total_score += 2));; #C X = 7
                    *) echo you should not be here, CRASH!!!!
                        exit 2;;
                esac
                ;;
            y|Y) case $opponent in
                    a|A) ((total_score += 4));; #A Y = 8
                    b|B) ((total_score += 5));; #B Y = 5
                    c|C) ((total_score += 6));; #C Y = 2
                    *) echo you should not be here, CRASH!!!!
                        exit 2;;
                esac
                ;;
            z|Z) case $opponent in
                    a|A) ((total_score += 8));; #A Z = 3
                    b|B) ((total_score += 9));; #B Z = 9
                    c|C) ((total_score += 7));; #C Z = 6
                    *) echo you should not be here, CRASH!!!!
                        exit 2;;
                esac
                ;;
            *) echo you should not be here, CRASH!!
                exit 1;;
        esac
        opponent=""
        #echo ${strategy[$idx]}
    fi
done
echo $total_score



