#!/bin/sh
while read id mark _;
do
    # ... insert mark/grade checking here ...
    # ps >= 50 && <65
    # fl < 50
    # cr >= 65 && <75
    # dn >= 75 && <85
    # hd >= 85 && <= 100
    # err

    # check for valid grade
    # negative, or greater than 100 or not a numebr
    if test "$mark" -eq "$mark" 2> /dev/null && test "$mark" -ge 0 && test "$mark" -le 100;
    then
        if test "$mark" -lt 50; then 
            echo FL
        # etc
        fi
    else
        echo "?? ($mark)" >& 2
done