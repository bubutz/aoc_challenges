#!/usr/bin/env python3
import sys
from utils import (
    printjson,
    file2list,
    checkfile
)


def main():
    input_file: str = sys.argv[1]
    checkfile(input_file)

    data: list = file2list(input_file)
    loc: int = 50  # Initial location
    zeroes_1: int = 0
    zeroes_2: int = 0

    for i in data:
        print(f"{loc:<5}{i:<5}", end="")
        pos: str = i[0].upper()
        mov: int = int(i[1:])
        hundreds: int = mov // 100
        moving: int = mov % 100
        if pos == 'R':
            loc += moving
            if loc >= 100:
                hundreds += 1
        elif pos == 'L':
            loc = loc + 100 - moving
            if loc <= 100 and 100 - moving != loc:
                hundreds += 1
        else:
            print(f'Unknown "{pos}".')
            sys.exit(1)
        print(f"{loc:<5}", end="")
        loc %= 100
        if loc == 0:
            zeroes_1 += 1
        zeroes_2 += hundreds
        print(f"{zeroes_1:<7} {zeroes_2:<7}")

    print("Part 1:", zeroes_1)
    print("Part 2:", zeroes_2)


if __name__ == '__main__':
    main()
