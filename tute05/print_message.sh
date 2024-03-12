#! /usr/bin/env dash

print_message() { # $@, $1, $2, $3, ...
    if test $# -eq 2; then
        echo "$0: error: $2"
        exit $1
    else 
        echo "$0: warning: $1"
    fi
}

echo "warning message:"
print_message "warning"

echo $1 $2 $3

echo "error message"
print_message 20 "error"
