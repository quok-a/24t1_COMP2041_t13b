#! /usr/bin/env dash

# ==============================================================================
# test00.sh
# Testing pushy commands.
#
# Written by: Your Name <your_email@unsw.edu.au>
# Date: 00.03.24
# For COMP2041/9044 Assignment 1
# (this is an example modified from the tutorial solutions for week 5)
# ==============================================================================

# add the current directory to the PATH so scripts
# can still be executed from it after we cd

PATH="$PATH:$(pwd)"

# Create a temporary directory for the test.
test_dir="$(mktemp -d)"
cd "$test_dir" || exit 1

# Create some files to hold output.

expected_output="$(mktemp)"
actual_output="$(mktemp)"

ref=2041 # comment out to run own implementation

# Remove the temporary directory when the test is done.

trap 'rm "$expected_output" "$actual_output" -rf "$test_dir"' INT HUP QUIT TERM EXIT
####################################################################################
# Create pushy repository

cat > "$expected_output" <<EOF
Initialized empty pushy repository in .pushy
EOF

pushy-init > "$actual_output" 2>&1

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed test"
    exit 1
fi

# create pushy repo where it already exists
# compare against reference implementation
# $ref pushy-init > "$actual_output" 2>&1
2041 pushy-init >"$expected_output" 2>&1
pushy-init > "$actual_output" 2>&1

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed test"
    exit 1
fi

####################################################################################

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed test"
    exit 1
fi

echo "Passed test"
exit 0