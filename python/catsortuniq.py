#! /usr/bin/env python
# 
# Write the equivalent of 
#
#   cat FOO | sort | uniq 
# 
# or simply
#
#   sort -u FOO
#
# in python

import fileinput  
import sys

lines={}


for line in fileinput.input(sys.argv[1:]):
    line = line.rstrip()

    if len(line) < 1:
        pass
    else:
        lines[line] = line

print ">>>"
for line in lines.keys():
    print line
print "<<<"    





