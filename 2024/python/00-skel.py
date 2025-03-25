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


def main():
    pass


if __name__ == '__main__':
    if len(sys.argv) <= 1:
        print('ERR: Please provide filepath for data.')
        sys.exit(1)

    inputfile = sys.argv[1]
    checkfile(inputfile)

    f = open(inputfile, 'r')
    puzzle = f.read()
    f.close()

    main()
