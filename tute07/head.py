#! /usr/bin/env python3

import sys

n = 10
flag = 1
if len(sys.argv) > 1 and sys.argv[1].startswith('-'):
    n = int(sys.argv[1][1:])
    flag = 2


# i = 0
# for line in sys.stdin:
#     if i == n: break
#     sys.stdout.write(line)
#     i += 1
    
for file in sys.argv[flag:]:
    try:
        print(f"==> {file} <===")
        f = open(file)
        i = 0
        for line in f:
            if i == n: break
            print(line)
            i += 1
        f.close
    except IOError as e:
        print(f"{sys.argv[0]}: cannot open {file}: {e.strerror}")
