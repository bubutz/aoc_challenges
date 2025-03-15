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


def partone(e: list):
    if not isinstance(e, list):
        e: list = e.split()
    e_len: int = len(e)
    asc: bool = bool()

    # Check if the sequence is asc or desc
    for i in range(1, e_len):
        if int(e[i]) - int(e[i-1]) == 0:
            continue
        if int(e[i]) - int(e[i-1]) > 0:
            asc = True
            break
        else:
            break

    for j in range(1, e_len):
        diff = int(e[j]) - int(e[j-1])
        if (asc and (diff <= 0 or diff > 3)) or (
                not asc and (diff >= 0 or diff < -3)):
            return False

    return True


def parttwo(e: list):
    e: list = e.split()
    e_len: int = len(e)
    newlist: list = []

    for skip_idx in range(0, e_len):
        # print(f'e: {e}')
        newlist = e[:skip_idx] + e[skip_idx + 1:]
        # print(f'newlist: {newlist}')
        if partone(newlist):
            return True

    return False


def main():
    # Condition 1: Continuously ascend or descend
    # Condition 2: ASC or DSC cannot be more than 3 per step

    partone_safe: list = []
    partone_unsafe: list = []
    parttwo_safe: list = []
    parttwo_unsafe: list = []

    for row in puzzle:
        if partone(row):
            partone_safe.append(row)
        else:
            partone_unsafe.append(row)
        if parttwo(row):
            parttwo_safe.append(row)
        else:
            parttwo_unsafe.append(row)

    print(f'Part 1 safe:   {len(partone_safe)}')
    print(f'Part 1 unsafe: {len(partone_unsafe)}')
    print(f'Part 2 safe:   {len(parttwo_safe)}')
    print(f'Part 2 unsafe: {len(parttwo_unsafe)}')

    # parttwo_safe: list = []
    # parttwo_unsafe: list = []


if __name__ == '__main__':
    if len(sys.argv) <= 1:
        print('ERR: Please provide filepath for data.')
        sys.exit(1)

    inputfile = sys.argv[1]
    checkfile(inputfile)

    f = open(inputfile, 'r')
    puzzle: list = f.read().strip().split('\n')
    f.close()

    main()
