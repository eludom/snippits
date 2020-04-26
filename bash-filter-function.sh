#! /bin/bash
# demonstrate bash function filtering of stdin, stdout

function 2toTWO() {
  # subtitute all "2" characters on stdin with "TWO"
  sed -e 's/2/TWO/g'
}

seq 12 | 2toTWO
