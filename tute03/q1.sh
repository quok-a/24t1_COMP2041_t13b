#!/bin/sh
x=2  y='Y Y'  z=ls

touch a b c

echo a   b   c
echo "a   b   c"
echo $y
echo x$x
echo $xx
echo ${x}x
echo "$y"
echo '$y'
echo $($y)
echo $($z)
echo $(echo a b c)