#! /bin/bash
# What: List image dates for files in this directory
# 
# How (Usage):
#   imageDates.sh
#
# Who: George Jones
#
# When: Wed Dec 16 04:34:54 2015 
#
# Why: I have a lot of pictures
#
# Future
#   -  possiby set image dates from file/directory names
#      (e.g. if long ago I grouped files into directorys or put dates on scanned immages
#      add the data to exif)
#   -  Be more creative/general with command line arguments
#
# Where:
#   - See: http://www.exiv2.org/index.html

for i in *.jpg; do  when=`exif -m --tag=0x132 2> /dev/null $i`; echo \| $i \| $when \|; done
