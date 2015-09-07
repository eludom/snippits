#! /bin/bash

# http://rosettacode.org/wiki/Associative_array/Creation#UNIX_Shell

declare -a arglist

declare -A hash
hash=( [key1]=val1 [key2]=val2 )
hash[key3]=val3
echo "${hash[key3]}"

arglist[${#arglist[*]}]=hash

declare -A hash2
hash2=( [key1]=val1a [key2]=val2b )

arglist[${#arglist[*]}]=hash2

for arg in arglist; do
  echo key1 ${arg[key1]}
done


#arg["stack-size"]=("s:","stack-size:","Stack size","[0-9"]
