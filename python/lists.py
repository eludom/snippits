#! /usr/bin/env python
"""
Simple tests of arrays in python
"""

foo=[1,2,3]
foo.append(4)
print "foo is ", foo

bar=foo # bar is a reference to foo
bar.append(5)
print "foo is ", foo
