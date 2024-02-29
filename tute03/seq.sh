#! /usr/bin/env dash

if test $# -eq 1; then
    start=1
    increment=1
    last=$1
elif test $# -eq 2; then
    start=$1
    increment=1
    last=$2
elif test $# -eq 3; then
    start=$1
    increment=$2
    last=$3
else
    echo "usage: $0 [FIRST [INCREMENT]] LAST" >& 2
    exit 1
fi

# args are integers
if test $start -eq $start 2> /dev/null; then
else 
    echo "$0 error: start must be an integer" >& 2
    exit 1
fi
# increment is positive
if test $increment -gt 0 2> /dev/null; then
else 
    echo "$0 error: increment must be greater than 0" >& 2
    exit 1
fi
# last > first
if test $last -gt $first 2> /dev/null; then
else 
    echo "$0 error: last must be greater than first" >& 2
    exit 1
fi

cur=$start
while test $cur -le $last; do
    echo $cur
    cur=$((cur + increment))
done