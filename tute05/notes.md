# tute05: git and discussing assignment 1

1. help! the assignment doesn't fully explain everything?!
- compare against the reference implementation to examine behaviour
2. can i do the assignment in 3 days? how hard is it?
- subset 0 is very achievable, subset 1 is a bit hard, subset 2 is very difficult
3. git-init vs pushy-init
```
.git    // creates some extra stuff inside .git
.pushy  // all we're checking is that .pushy exists, beyond that you can do whatever you want
```
4. git/pushy-add
- 'stages' files to be commited/adds them to the git/pushy index
5. index
- files that are being tracked by the repository, stored in .pushy
6. commits
will have a commit num attached to it, preserves the state of the repo
7. you are required to submit test scripts 00-09, see test_example.sh

12. Write a shell function print_message that, given an optional exit status and a message:
    - If no exit status is given the program should print a warning
    - If an exit status is given the program should print an error and exit the program

