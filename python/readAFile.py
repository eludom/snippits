#! /usr/bin/env python
"""
Simple tests of arrays in python
"""

import sys

with open("foo.txt") as fileHandle:
    for line in fileHandle:
        line = line.strip()
        print "line is /%s/" % (line)
       
