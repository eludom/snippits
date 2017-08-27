#!/bin/bash
# bash command line arg parsing
# http://www.linuxquestions.org/questions/programming-9/processing-command-args-in-bash-367563/

ARGV0=$0 # First argument is shell command (as in C)
echo "Command: $ARGV0"

ARGC=$#  # Number of args, not counting $0
echo "Number of args: $ARGC"

i=1  # Used as argument index
while true; do
    if [ $1 ]; then
        echo "Argv[$i] = $1" # Always print $1, shifting $2 into $1 later
  	shift
     else
   	break # Stop loop when no more args.
     fi
     i=$((i+1))
done
echo "Done."
