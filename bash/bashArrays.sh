source bashUtils.sh

isArray() {
    # Test if variable is an array
    #
    # Usage: isArray NAME
    # Return: 0 if NAME is array, 1 otherwise.
    #
    # https://gist.github.com/coderofsalvation/8377369
    #
    [ -z "${1:-}" ] && echo "isArray: Missing array name." 1>&2 && return 1
    if [ -n "$BASH" ]; then
        # this is officially a hack, but it seems to be the best solution.  Yuck.
        declare -p ${1:-''} 2> /dev/null | grep 'declare \-a' >/dev/null && return 0
    fi
    return 1
}

arrayCreate() {
    # Create an array.
    #
    # Usgae: arrayCreate NAME [element1 element2...]
    # Ouput: NAME set as global
    # Return: 0 if defined, 1 otherwise.
    #
    [ -z "${1:-}" ] && echo "createArray: Missing array name." 1>&2 && return 1
    local var=${1}
    shift
    
    if [ -z "${1:-''}" ]; then
	eval "$var=( )"
    else
	eval "$var=(  $@ )"
    fi
    
    return 0
}

#
# void addelementtoarray (string <array_name>, string <element>, ...)
#
# http://www.linuxquestions.org/questions/programming-9/bash-array-add-function-example-using-indirect-array-reference-as-function-argument-815329/

function arrayAppend {
    [ -z "${1:-}" ] && echo "arrayAppend: Missing array name." 1>&2 && return 1    
    local R=$1 A
    shift

    ! isArray $R && echo "arrayAppend: $R is not an array " 1>&2 && return 1    

    #echo R is   $(eval "echo \${$R[@]-}")

    for A; do
        eval "$R[\${#$R[@]}]=\$A"
    done
    return 0

    # Or a one liner but more runtime expensive with large arrays since all elements will always expand.
    # In this method also, all element IDs are reset starting from 0.
    # Maybe this is also what you need since the IDs here does not need to be sorted.  A problem may occur on the former if an ID exist that is higher than the number of elements.
    # Only that it resets all IDs everytime.
    # eval "$1=(\"\${$1[@]}\" \"${2:@}\")"
}


arrayTest() {
    # execute a test of array expected values
    #
    # Usage: arrayTest "test name" arrayName "expected values"
    # Output: pass/fail message to stdout
    # Return: 0 on pass, 1 otherwise

    [ -z "${1:-}" ] && echo "arrayTest: Missing test name." 1>&2 && return 1
    local testName="${1:-}"
    shift
    #echo testName is ${testName}
    
    [ -z "${1:-}" ] && echo "arrayTest: Missing array name." 1>&2 && return 1
    local arrayName="${1:-}"
    shift
    #echo arrayName is ${arrayName}
    
#    [ -z "${1:-}" ] && echo "arrayTest: Missing array value(s)." 1>&2 && return 1
    local expectedValues="${@:-}"
    shift

    eval 'actualValues=${'$arrayName'[@]-}'

    if stringsEqual "${expectedValues-}" "${actualValues-}"; then
       echo pass: $testName
       return 0
    else
       echo diff
       diff -b  <(echo "$expectedValues" ) <(echo "$actualValues")
       echo fail: $testName
       return 1
    fi
}
