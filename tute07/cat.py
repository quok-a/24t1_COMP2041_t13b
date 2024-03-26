#! /usr/bin/env python3

import sys
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument("-n", "--number", action="store_true", help="prints the line numbers")
parser.add_argument("-v", "--verbose", action="store_true", help="displays all characters in printable form")
parser.add_argument("files", nargs="*", default="-", help="files to cat")

args = parser.parse_args()

print(args)

i = 1
for file in args.files:
    try:
        if file == "-":
            stream = sys.stdin
        else:
            stream = open(file)

        for line in stream:
            if args.verbose:
                trans = str.translate({ i: "^" + chr(i + ord('A') - 1) for i in range(32) if i != 10}) 
                line = line.translate(trans).replace('\n', '$\n')

            if args.number:
                sys.stdout.write(i)
            sys.stdout.write(line)
            i += 1

        if stream != sys.stdin:
            stream.close()

    except IOError as e:
        print(f"{sys.argv[0]}: can not open: {e.filename}: {e.strerror}")

# if len(sys.argv) == 1:
#     sys.argv.append("-")

# for filename in sys.argv[1:]:


