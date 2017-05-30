#! /usr/bin/env python
"""
Simple tests of dictionaries in python
"""

foo = {}
foo["foo"]="fooo"
foo["bar"]="baaar"
foo["baz"]="baaaz"

for k in foo.keys():
    print "key", k, "value", foo[k]
    

    
