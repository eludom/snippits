#! /bin/bash
# Example of mod function in a loop

start=`date +%s`

for i in {1..100}; do
  if ((i % 20 == 0)); then
    echo $i
    sleep 1
    now=`date +%s`
    echo start: $start now: $now elapsed: $((now-start))
  fi
done
