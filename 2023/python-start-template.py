#!/usr/bin/env python3
import sys


def main():
    pass


if __name__ == '__main__':
    if len(sys.argv) < 1:
        sys.exit("Need filename.")
    else:
        file = sys.argv[1]

    with open(file) as f:
        puzzle = f.read().rstrip('\n')

    main()
