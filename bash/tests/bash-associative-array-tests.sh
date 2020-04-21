#! /bin/bash
#! /home/gmj/bin/bash5-patched
# This is a quick set of tests to see where bash associative arrays
# start to slow down.   The tests will be done by generating a list of
# IP addresses as a text file, having bash read them, add them to an
# associative array, count them and report the time it took to do add
# every N thousand entries.

# These numbers are run using GNU bash, version 5.0.16(1)-release
# (x86_64-pc-linux-gnu) on a system running Ubuntu 18.04.4 LTS \
# Intel(R) Core(TM) i3-7100U CPU @ 2.40GHz with 8gb


set -u; set -e; # this is bash.  be safe.

echo BASH_VERSION $BASH_VERSION

# Generate input text file
#
# Generate a text file containing a full Class A's worth of IP
# addresses, one per line.   This is done with the CERT [[https://tools.netsa.cert.org/silk/index.html][SiLK]]
# tool rwsetbuild

ADDRESSES_FILE=addresses.txt

if [ ! -f $ADDRESSES_FILE ]; then
    echo Createing $ADDRESSES_FILE
    echo "1.0.0.0/8" > rwset.txt
    rm -f rwset.set
    rwsetbuild rwset.txt rwset.set
    rwsetcat rwset.set > $ADDRESSES_FILE
fi

# sample contents
echo
set -x
head $ADDRESSES_FILE
tail $ADDRESSES_FILE
set +x
pwd

# Read the file, adding each line to an associative array
# count and time.

LINES=0 # current line count
REPORT_EVERY=100000 # report time, count every N lines
MAX_LINES=10000000  # for testing
START=`date +%s` # start time

declare -A IP_ADDRS # Array to hold IP addresses

while IFS= read -r ip; do
    LINES=$((LINES + 1))
    IP_ADDRS[$ip]=$ip

    if (( LINES % REPORT_EVERY == 0 )); then
        NOW=`date +%s`
        ELAPSED=$((NOW - START))
        if (( ELAPSED > 0 )); then
            lines_per_sec=`echo "scale=2; $LINES/$ELAPSED" | bc`
            echo lines_per_sec $lines_per_sec LINES $LINES ELAPSED $ELAPSED
        fi
    fi

    if (( LINES > MAX_LINES)); then
        break
    fi
done < $ADDRESSES_FILE
END=`date +%s` # end time

# dump whats there
# for K in "${!IP_ADDRS[@]}"; do echo $K --- ${IP_ADDRS[$K]}; done

echo START $START
echo END $END
DURATION=$((END-START))
echo DURATION $DURATION
echo LINES $LINES
