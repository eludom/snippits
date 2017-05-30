#! /usr/bin/env python

import myhash


animals = myhash.MyHash("dogs")
animals.set("foo","bar")
animals.set("bar","bark")
animals.set("zzz","zzzzz")
animals.set("baaz","baaazzz")

print "animal foo is ", animals.get("foo")
print "animal bar is ", animals.get("bar")
print "animal bar is ", animals.get_fast("bar")
print "animal bar is ", animals.get("zzz")
print "animal bar is ", animals.get_fast("zzz")



