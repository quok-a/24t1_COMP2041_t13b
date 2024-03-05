#!/bin/dash
# takes in a program name
# use ls to print details of matching files in directories in $PATH

# error testing
if test $# -eq 0; then
    echo "Usage: $0 <programs>"
    exit 1
fi


exists=0
for prog in $@; do # loop through command line args
    paths=$(echo "$PATH" | tr ':' ' ') # split path into space separated string
    for path in $paths; do # notice if you use double quotes around $path, it won't split

        f="$path/$prog"
        if test -x "$f"; then 
            ls "$f"
            exists=1
        fi
    done
done

if test "$exists" -eq 0; then
    echo "$1 not found"
fi
