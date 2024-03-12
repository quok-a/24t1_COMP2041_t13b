#! /usr/bin/env dash
# given archive files, use the correct program to extract the files

case $# in 
    0) 
        echo "Usage $0 <file> [<file> ..]"
        exit
    ;;
esac

for f in "$@"; do 
    if test -f "$f"; then
        case "$f" in 
            *.tar) tax xf "$f" ;;
            *.zip) unzip "$f" ;;
            *)
                echo "$0 error: '$f' cannot be extracted" >&2
                exit 1
        esac
    else 
        echo "$f is not a file"
        exit 1
    fi
done

exit 