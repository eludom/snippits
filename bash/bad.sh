#! /bin/bash
# echo 'normal' outpout to stdout, error output to stderr, exit 1

echo Normal output from bad.sh
echo ERROR output from bad.sh 1>&2
exit 1
