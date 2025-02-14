#!/usr/bin/env python3

import sys
import os


def checkfile(f: str):
    if not os.path.isfile(f):
        print(f'ERR: File "{f}" doesn\'t exists.')
        sys.exit(2)

    if not os.path.getsize(f):
        print(f'ERR: File {inputfile} is empty.')
        sys.exit(2)


def file_to_arr(puzzle: str, pos: str):
    arr = []

    if pos == 'left':
        for line in puzzle.strip().split('\n'):
            d = line.split()
            arr.append(d[0])
    elif pos == 'right':
        for line in puzzle.strip().split('\n'):
            d = line.split()
            arr.append(d[1])
    else:
        print('Fail to convert to list.')
        sys.exit(3)

    return arr


def part_one(left: list, right: list):
    # Sort array 1 and 2 in ASC
    l_arr = left.copy()
    l_arr.sort()
    r_arr = right.copy()
    r_arr.sort()

    # Store the diff from both array
    dist = 0
    if len(l_arr) >= len(r_arr):
        arr_len = len(l_arr)
    else:
        arr_len = len(r_arr)

    for i in range(0, arr_len):
        dist = dist + abs(int(l_arr[i]) - int(r_arr[i]))

    return dist


def part_two(left: list, right: list):
    # loop through left list
    # multiply left arr e with the occurrence
    # accumulate the result
    similarity_score = 0
    for i in left:
        # check how many of the i occurs in right list
        for j in right:
            if i == j:
                similarity_score += int(j)

    return similarity_score


if __name__ == '__main__':
    if len(sys.argv) <= 1:
        print('ERR: Please provide filepath for data.')
        sys.exit(1)

    inputfile = sys.argv[1]
    checkfile(inputfile)

    f = open(inputfile, 'r')
    puzzle = f.read()
    f.close()
    # print(puzzle)

    # Store column 1 in array1, column 2 in array2
    left_arr = file_to_arr(puzzle, 'left')
    right_arr = file_to_arr(puzzle, 'right')

    part_one_result = part_one(left_arr, right_arr)
    print(f'Part 1 answer: {part_one_result}')

    part_two_result = part_two(left_arr, right_arr)
    print(f'Part 2 answer: {part_two_result}')
