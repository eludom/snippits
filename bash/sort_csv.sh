function sort_csv() {
    # Sort a csv file
    #
    # Perform a sort of a csv file on a single numberic column
    #
    # Inputs

    local INPUT_FILE=$1 # file to sort
    local SORT_ON=$2 # numerc field to sort
    local HEADER_LINES=${3:-1}  # number of header lines

    # local vars
    local SORT_THIS=`TMPDIR=. mktemp`
    local SAVED_HEADERS=`TMPDIR=. mktemp`
    local MOVE_SUCCEEDED=0 # track if we can restore from the tmp file
    local RESTORE_ORIGINAL=1  # if anything goes wrong, restore original
    # local CSV_HEADER_LINE=$((1+LINES_BEFORE_HEADER))


    # | tee >(head -1 > $STATS_FILE) | tail -n+2 | sort -gr -k $sort_field -t,

    sed -n "1,${HEADER_LINES}p" <$INPUT_FILE > $SAVED_HEADERS
    mv $INPUT_FILE $SORT_THIS && \
        MOVE_SUCCEEDED=1 && \
        mv $SAVED_HEADERS $INPUT_FILE && \
        sort -t, -gr -k $SORT_ON <(tail -n+$((1+HEADER_LINES)) $SORT_THIS) >> $INPUT_FILE && \
        RESTORE_ORIGINAL=0

    if ((RESTORE_ORIGINAL)); then
        # do this in case anything went wrong
        >&2 echo "sort_csv: something went wrong."

        if ((MOVE_SUCCEEDED)); then
            >&2 echo "sort_csv: restoring $INPUT_FILE from $SORT_THIS"
            rm -f $INPUT_FILE
            mv $SORT_THIS $INPUT_FILE
            >&2 echo "sort_csv: restore succeeded"
        fi
    fi
}
