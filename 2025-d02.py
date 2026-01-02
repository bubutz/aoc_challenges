#!/usr/bin/env python3
import sys
from utils import (
    file2str,
    checkfile,
    divceil
)


def main():
    input_file: str = sys.argv[1]
    checkfile(input_file)
    data: list = file2str(input_file).split(',')
    invalid1: int = 0
    invalid2: int = 0

    for i in data:
        start: int = int(i.split('-')[0])
        end: int = int(i.split('-')[1])
        # print(i)

        # Part 1
        for j in range(start, end + 1):
            if len(str(j)) % 2 == 1:
                continue
            numlen: int = int(len(str(j)) / 2)
            front: int = int(str(j)[:numlen])
            rear: int = int(str(j)[numlen:])
            # print(f'{j} front: {type(front)}{front} rear: {type(rear)}{rear}')
            if front == rear:
                invalid1 += j

        # Part 2
        print(start, end)
        for j in range(start, end + 1):
            numlen: int = int(len(str(j)))
            midpoint: int = divceil(numlen, 2)

            for k in range(1, midpoint + 1):  # +1 to include midpoint itself
                if numlen % k != 0:
                    continue
                numlist: list[str] = [str(j)[x:x+k] for x in range(0, numlen, k)]
                # print(j, k, numlist)
                if len(set(numlist)) == 1:
                    invalid2 += j
                    print('OK:', j, k, numlist)
                    break
                # else:
                #     print('NG:', start, end, j, k, numlist)

    print("part1:", invalid1)
    print("part2:", invalid2)


if __name__ == '__main__':
    main()
