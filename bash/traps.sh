#! /bin/bash
# test traps
#
# http://hackaday.com/2017/07/21/linux-fu-better-bash-scripting/?utm_source=cronweekly.com

array tmpfiles = ()

tmpfile="foo$$.tmp"
trap "echo trap removing tmpfile; rm -f "${tmpfile}";  exit" INT TERM EXIT

echo foo > "${tmpfile}" 

exit 1
trap - INT TERM EXIT
