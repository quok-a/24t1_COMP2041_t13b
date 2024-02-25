# !/bin/sh

echo "this is big Big BIG\nbut this is not so big" |

# deletes any spaces, each lines combines into one long word
# thus wc will count the number of lines as the number of words (2)
# tr -d ' ' | wc -w 

# the tr command is described in question 3, we split each word into its own line.
# wc -l counts the number of lines in a file, thus we count the number of words
# as we have split them each into their own line (11 words/lines)
# tr -cs '[:alpha:]' '\n' | wc -l

# the second tr command converts lowercase to uppercase, we then sort (important)
# and uniq -c will count the number of times a line occurs in the file, this only works
# when equal lines are adjacent to each other (hence we sort)
# tr -cs '[:alpha:]' '\n' | tr '[:lower:]' '[:upper:]' | sort | uniq -c