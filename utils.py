def file2list(filename: str) -> list:
    with open(filename, 'r') as f:
        lines = f.read().splitlines()
        return lines
