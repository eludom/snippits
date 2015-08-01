#
# Bash utility functions.
#
# George Jones <gmj@pobox.com>, Sat Aug  1 12:27:05 2015
#

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



