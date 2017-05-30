#! /usr/bin/env python
"""
Simple tests of lists and tuples in python
"""

foo=(42,43,44)
bar=[42,43,44]
print type(foo)
print type(bar)
print len(foo)
print dir(foo)
blort= list(foo) + bar
print blort
