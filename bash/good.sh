#! /bin/bash
# echo 'normal' outpout to stdout, error output to stderr, exit 0

echo Normal output form good.sh
echo ERROR output form good.sh 1>&2
exit 0
