# tute02: filters

1. we can't sort the file by surname as is since the surnames all occur on different fields, consider reformatting.
2.  a. `head -3` or `head -n3`

    b. `grep -E '^(cs|se|bi|en)[0-9]{4}' q2.txt`

    c. `grep -E '/bin/bash$' q2.txt | cut -d':' -f1`

    d. `cut -d':' -f1,2 q2.txt | tr ':' '\t' > passwords.txt`

3. `tr -cs 'a-zA-Z0-9' '\n' < someFile`, `[:alpha:]`can also be used in place of `a-zA-Z0-9`
- `-c` takes the complement, so it will match any *non*-alphanumeric character
- `-s` 'squeezes' repeat characters, so in this case as we replace non alphanumeric characters with new lines, it will combine adjacent new lines into one.
4. see `q4.sh`
5.  a. in order to use join, we need to sort the files first by a common key
    e.g. `sort -t'|' -k1,1 q5.1511.psv > q5.1511.psv` !!DANGER!! the shell will concatenate any file we want to write to before passing it to any program, so write to a new file `sort -t'|' -k1,1 q5.1511.psv > q5.1511.sorted.psv`.

    b. `join -t'|' q5.1511.sorted.psv q5.2041.sorted.psv`

    c. `join -t'|' -a1 -a2 -o auto -e'--' q5.1511.sorted.psv q5.2041.sorted.psv`, the `-o auto` will allow `join` to calculate how many fields are required

    d. `join -t'|' q5.1511.sorted.psv q5.2041.sorted.psv | sort -t'|' -k2,2 -k3,3r`

6.  a. `sort q6.txt -k3,3 -k2,2`

    b. `sort q6.txt -k4,4 -k1.8,1n`, notice the program number starts as the 8th character in the first field, we can use `x.y` to denote a character position `x` within field `y`, as this is a number we also use the `n` flag at the end to indicate that we want to sort this field numerically.

    c. `sed -Ee 's/\t0/\t/g' q6.txt`, we use the `g` flag at the end of out sed command to *globally* make this change, otherwise sed will only replace the first instance of the match.

    d. `sed -Ee '/^program2\b/,/^program13\b/d' q6.txt`, `\b` is a word boundary within regex, in this case `//,//d` specifies a range of matches, and the `d` flag indicates we want to delete the lines within the range