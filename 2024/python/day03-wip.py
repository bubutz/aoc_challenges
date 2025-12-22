#!/usr/bin/env python3

import sys
import os
import re


def checkfile(f: str):
    if not os.path.isfile(f):
        print(f'ERR: File "{f}" doesn\'t exists.')
        sys.exit(2)

    if not os.path.getsize(f):
        print(f'ERR: File {inputfile} is empty.')
        sys.exit(2)


def partone(l: list):
    total: int = 0
    all_muls: list = list()
    for mul in l:
        all_muls.append(mul.replace('mul(', '').replace(')', ''))

    for val in all_muls:
        val = val.split(',')
        total = total + (int(val[0]) * int(val[1]))

    return total


def parttwo(l: list):
    total: int = 0

    # things to keep
    #   mul(xxx,yyy)
    #   do
    #   don't
    all_muls: list = list()
    for mul in l:
        all_muls.append(mul.replace('mul(', '').replace(')', ''))

    print(f'Part 2 all val: {all_muls}')
    # Capture if start with m or d
    # fail if next char is not mul(xxx,yyy) or dont
    # when fail, append that to list

    # Loop through captured list
    # Initial = do (set as true)
    # Calculate when it's do
    # Set to dont (false) when don't appears
    # Dont calculate when it's don't


def main():
    # loop each character
    # if character is m append to string
    # next expected character = ul([int*, int*])

    all_muls: list = list()
    regex = 'mul\([0-9]*,[0-9]*\)'
    for line in puzzle:
        all_muls = all_muls + re.findall(regex, line)

    part1 = partone(all_muls)
    print(f'Part 1: {part1}')

    parttwo(all_muls)


if __name__ == '__main__':
    if len(sys.argv) <= 1:
        print('ERR: Please provide filepath for data.')
        sys.exit(1)

    inputfile = sys.argv[1]
    checkfile(inputfile)

    f = open(inputfile, 'r')
    # puzzle = f.read()
    puzzle = f.read().splitlines()
    f.close()

    main()
