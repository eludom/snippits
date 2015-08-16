# Bash array fucntions
#
# Copyright (C) George Jones <gmj@pobox.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
# * TODO LIST
# ** Functions to add
#    -arraySplit
#    -arrayJoin
#    -arrayPrepend (special case of append? with switch/option? wrapper?)
#
# ** General  TODOs
#   - Run validation tests, mark funcions as working or not, return 1 if not working.
#   - Figure out some way to add options/config, e.g. --noclobber for create, etc.




source bashUtils.sh

isArray() {
    # Test if variable is an array
    #
    # Usage: isArray NAME
    # Return: 0 if NAME is array, 1 otherwise.
    #
    # https://gist.github.com/coderofsalvation/8377369
    #
    export arrayError=""
    
    if [ -z "${1:-}" ]; then 
	arrayError="isArray: Missing array name."
	return 1
    fi
    
    if [ -n "$BASH" ]; then
        # this is officially a hack, but it seems to be the best solution.  Yuck.
        declare -p ${1:-''} 2> /dev/null | grep 'declare \-a' >/dev/null && return 0
    fi

    arrayError="isArray: ${1} is not an array."    
    return 1
}

arrayCreate() {
    # Create an array.
    #
    # Usgae: arrayCreate NAME [element1 element2...]
    # Ouput: NAME set as global, $arrayErr set as error message
    # Return: 0 if defined, 1 otherwise.
    #
    export arrayError=""
    
    if [ -z "${1:-}" ]; then
	arrayError="arrayCreate: Missing array name."
	echo  $arrayError 1>&2 
        return 1
    fi

    local var=${1}
    shift
    
    if [ -z "${1:-}" ]; then
        foo="foo"
	eval "$var=( )"
    else
	eval "$var=(  $@ )"
    fi

    return 0
}

arrayLength() {
   echo "Implment this.  Reurn length"
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
    # Usage: arrayTest "test name" "expected results "actual results"
    # Output: pass/fail message to stdout
    # Return: 0 on pass, 1 otherwise

    [ -z "${1:-}" ] && echo "arrayTest: Missing test name." 1>&2 && return 1
    local testName="${1:-}"
    shift
    
    [ -z "${1:-}" ] && echo "arrayTest: Missing expected values." 1>&2 && return 1
    local expectedValues="${1:-}"
    shift

    [ -z "${1:-}" ] && echo "arrayTest: Missing actual values." 1>&2 && return 1
    local actualValues="${1:-}"
    shift

    if stringsEqual "${expectedValues-}" "${actualValues-}"; then
       echo pass: $testName
       return 0
    else
       echo diff expected values and actual values 1>&1
       diff -b  <(echo "$expectedValues" ) <(echo "$actualValues")
       echo fail: $testName
       return 1
    fi
}


arraySplit() {
    echo "Implment this.  Take char/regexp, split, return array"
}


arrayJoin() {
    echo "Implment this.  Take char/regexp, rarray, join, return array"
}

arrayDestroy() {
    echo "Implenet this.  unset an array."
}
