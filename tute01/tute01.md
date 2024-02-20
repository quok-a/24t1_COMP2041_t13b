# tute01: regex

regex -> regular expression, pattern matching in text

uses: search engines, search and replace (in text editing)

see course website for contact details

forum: on ed (best for general course questions)

## regex basics

- a -> a
- a* -> 0 or more repetitions of a
- a|b -> matches either a or b
- (ab|ac) -> grouping, will match either ab or ac
    - we can also do something like, a*(b|c)
- we can use \ to negate any special character meanings, \\* will match a literal *

if you wanted to, you could write all of your regex with the above (not advised)

## regex extras (for convenience)

- . -> any character
- [a-z] -> any english lower case letter
    - [0-9], [a], [a-zA-z0-9] are also options [^aeiou]
- [^aeiou] -> any constonant (non vowel)
    - if you want to match ^, it should be the second or further character within the brackets, otherwise it will negate (what else could you do?)
- [*a-z] -> *h (\* loses it's meaning within the bracket)

## anchoring

- ^hi -> will only match if hi occurs at the start of the string
    - e.g. ^hi* -> `higher`, but not `this`
- by$ -> matches if by occurs at the end of the string
    - *by$ -> `standby` but not `bygones`

> NB: ^ has 2 meanings, ^[abc] behaves differently to [^abc]

> when we get to python, the regex package has some included functions that will do this anchoring for us

## repetition

- we've already looked at *
- a+ -> *one* or more repetitions of a
- a? -> *zero* or *one* occurence of a
- a{n} -> matches *n* repetitions of a
- a{n,m} -> *n* to *m* repetitions of a
- a{n,} -> *n* or *more* repetitions of a
- a{,m} -> *m* of *fewer* repetitions of a

6. 
    a. `^#`, given lines that start with `#` are preprocessor

    `^\s*#\s*[_a-zA-Z]`, as the [GCC documentation](https://gcc.gnu.org/onlinedocs/cpp/The-preprocessing-language.html) defenition allows for whitespace before and after `#`, with an identifier following the `#`.

    b. using the solution and defenition from part a: `^[^#]|^$`

    c. ` $`, or `\s$` (which will allow for other whitespace characters such as tabs)

    d. `[BHLP]arry`

    e. `hello .* world`, notice here that we have made the assumption that hello is followed by a space, and world is preceded by one. some time later could be immediately so perhaps `hello.*world` is more correct

    f. `c[ae]l[ae]nd[ae]r`

    g. `(-?[0-9]|0*)(,(-?[1-9][0-9]|0)* )*`

    h. `"[^"]*\\n"`, notice we escape the backslash (from the newline), also note that we don't handle escaped quotes

13. `[0-9]*.[0-9]*` consider that it is possible to then match something like `00.000000`, or `03.1230` which we probably don't consider valid. 
`(0|[1-9][0-9]*)\.([0-9]*[1-9]|0)` accounts for any leading and trailing `0`s

14. `grep -E ^$` is an equivalent command to `grep -Ev .`. the `-v` flag will invert matches so the command will match any command that is the opposite to `.` (any character), thus it will match any empty line. We can of course also do this by using anchoring characters adjacent to each other so that we immediately match the end of the line after we match the start of the line.
