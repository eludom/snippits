#! /usr/bin/gawk -f
#! /home/gmj/bin/bash5-patched
# This is a quick set of tests to see where bash associative arrays
# start to slow down.   The tests will be done by generating a list of
# IP addresses as a text file, having bash read them, add them to an
# associative array, count them and report the time it took to do add
# every N thousand entries.

# These numbers are run using GNU bash, version 5.0.16(1)-release
# (x86_64-pc-linux-gnu) on a system running Ubuntu 18.04.4 LTS \
# Intel(R) Core(TM) i3-7100U CPU @ 2.40GHz with 8gb


# set -u; set -e; # this is bash.  be safe.


BEGIN {
    print "BEGIN"
    print ""

    system("gawk --version | head -1")

    LINES=0 # current line count
    REPORT_EVERY= 100000#100000 # report time, count every N lines
    MAX_LINES=10000000 #10000000  # for testing
    START=systime() # start time
    print "START", START

    print ""

    print "PROCESSING"
    print ""
}

{LINES++}
{IP_ADDRS[$1]=$1}

{
    if (LINES % REPORT_EVERY == 0) {
        #system("sleep 1")
        NOW=systime()
        ELAPSED=(NOW - START)

        if (ELAPSED > 0) {
            LINES_PER_SEC = LINES / ELAPSED
        } else {
            LINES_PER_SEC = 0
        }
        print "lines_per_sec", LINES_PER_SEC, "LINES", LINES, "ELAPSED", ELAPSED
    }
}

{if (LINES > MAX_LINES) exit}

END {
    print ""
    print "END"
    print ""

    NOW=systime()
    ENDTIME=NOW
    ELAPSED=(NOW - START)
    print "ENDTIME", ENDTIME
    print "lines_per_sec", LINES_PER_SEC, "LINES", LINES, "ELAPSED", ELAPSED
}
