#!/usr/bin/env python3

import sys


def partone():
    partone: list[int] = list()
    total: int = 0

    for line in puzzle:
        tmp_list: list[int] = list()
        for c in line:
            if c.isdigit():
                tmp_list.append(c)
            else:
                continue
        if len(tmp_list) > 0:
            partone.append(f'{tmp_list[0]}{tmp_list[-1]}')
        else:
            partone.append(0)

    for i in partone:
        total = total + int(i)

    return total


def parttwo():
    parttwo: list[int] = list()
    total: int = 0

    # loop through each line
    for line in puzzle:
        #  loop through the line
        tmp_list: list[int] = list()
        cntr: int = 0
        while cntr < len(line):
            if line[cntr].isdigit():
                tmp_list.append(line[cntr])
                cntr += 1
                continue
            if line[cntr:cntr+3].lower() in num_dict:
                tmp_list.append(num_dict[line[cntr:cntr+3]])
                cntr += 3
                continue
            if line[cntr:cntr+4].lower() in num_dict:
                tmp_list.append(num_dict[line[cntr:cntr+4]])
                cntr += 4
                continue
            if line[cntr:cntr+5].lower() in num_dict:
                tmp_list.append(num_dict[line[cntr:cntr+5]])
                cntr += 5
                continue
            cntr += 1

        if len(tmp_list) > 0:
            parttwo.append(f'{tmp_list[0]}{tmp_list[-1]}')

    for i in parttwo:
        print(i)
        total = total + int(i)

    return total


def main():
    answer_one = partone()
    print(f'Part 1: {answer_one}')
    answer_two = parttwo()
    print(f'Part 2: {answer_two}')


if __name__ == '__main__':
    num_dict = {
        'one': '1',
        'two': '2',
        'three': '3',
        'four': '4',
        'five': '5',
        'six': '6',
        'seven': '7',
        'eight': '8',
        'nine': '9'
    }

    if len(sys.argv) < 1:
        sys.exit("Need filename.")
    else:
        file = sys.argv[1]

    with open(file) as f:
        puzzle: list[str] = f.read().rstrip('\n').splitlines()

    main()
