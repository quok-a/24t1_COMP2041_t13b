#!/bin/dash

# error testing
if test $# -ne 1 || ! test "$1" -eq "$1" 2>/dev/null || test "$1" -le 0; then
    echo "Usage: $0 <pos integer>"
    exit 1
fi

num=$1

# 1 is not prime
if test "$num" -eq 1; then
    echo "$num is not prime"
    exit 
fi

i=2
while test "$i" -lt "$num"; do
    if test $((num % i)) -eq 0; then
        echo "$num is not prime"
        exit 
    fi
    i=$((i + 1))
done

echo "$num is prime"