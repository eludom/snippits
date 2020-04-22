#
# Bash utility functions.
#
# George Jones <gmj@pobox.com>, 2018-12-24
#

set -e; set -u

# Helper functions
PROG=`basename "$0" | tr -d '\n'`

function info()  { echo ${PROG}\: info: "$@" 1>&2; }
function warn()  { echo ${PROG}\: warning: "$@" 1>&2; }
function error() { echo ${PROG}\: error: "$@" 1>&2; }
function debug() { [[ -v DEBUG ]] && echo ${PROG}\: debug: "$@" 1>&2 || true ; }
function die()   { echo ${PROG}\: fatal: "$@" 1>&2 && exit 1; }

function usage() {
    debug "in ${FUNCNAME[0]}"

    if [[ "$#" -gt 0 ]]; then
        warn $@
    fi

    cat <<END 1>&2
Usage: PROG [options] [args]

   arguments
     arg1               describe arg1

   options

    Group 1

    -a|--abc            what does --abc do?

    Other

    -d|--debug         debug output
    -h|--help          print usage
    -v|--verbose       verbose output
END
    exit 1
}


# http://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-bash-variable

trim() {
    # trim leading and trailing spaces
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
    echo -n "$var"
}

squash() {
    # remove all apaces
    local var="$*"
    echo "${var//[[:blank:]]/}"
}

lc() {
    # lowercase
    local var="$*"
    echo "$var" |  tr '[:upper:]' '[:lower:]'
}


stringsEqual() {
    # case-insensitive comparison with spaces removed
    onePrime=$(lc $(squash $1))
    twoPrime=$(lc $(squash $2))
    [[ "$onePrime" == "$twoPrime" ]] && return 0 || return 1
}


stringTests() {
    foo=" foo"
    bar="foo "
    foobar=" F o b"

    echo "trim /$foo/ /$(trim $foo)/"
    echo "trim /$bar/ /$(trim $bar)/"
    echo "squash /$foobar/ /$(squash $foobar)/"
    echo "lc /$foobar/ /$(lc $foobar)/"
    echo "lc squash /$foobar/ /$(lc $(squash $foobar))/"

    if stringsEqual "$foo" "$bar";then echo same; else echo different;fi
}
