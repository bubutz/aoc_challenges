import os
import sys


def divceil(a: int, b: int) -> int:
    return -(a // -b)


def file2list(filename: str) -> list:
    with open(filename, 'r') as f:
        lines = f.read().splitlines()
        return lines


def file2str(filename: str) -> str:
    with open(filename, 'r') as f:
        return f.read()


def checkfile(f: str) -> None:
    if not os.path.isfile(f):
        print("ERR: File", f, "doesn't exists.")
        sys.exit(1)
    if not os.path.getsize(f):
        print("ERR: File", f, "is empty.")
        sys.exit(1)


def printyml(d: list | dict, indent: int = 4) -> None:
    import yaml
    print(yaml.dump(d, indent=indent))


def printjson(d: list | dict, indent: int = 4) -> None:
    import json
    print(json.dumps(d, indent=indent))
