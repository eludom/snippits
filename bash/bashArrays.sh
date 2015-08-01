arrayCreate() {
    # Create an array.
    #
    # Usgae: arrayCreate NAME [element1 element2...]
    # Ouput: NAME set as global
    # Return: 0 if defined, 1 otherwise.
    #
    [ -z "${1:-''}" ] && echo "createArray: Missing variable name." 1>&2 && return 1
    local var=${1}
    shift
    
    if [ -z "${1:-''}" ]; then
	eval "$var=( )"
    else
	eval "$var=(  $@ )"
    fi
    
    return 0
}


isArray() {
    # Test if variable is an array
    #
    # Usage: isArray NAME
    # Return: 0 if NAME is array, 1 otherwise.
    #
    # https://gist.github.com/coderofsalvation/8377369
    #
    [ -z "${1:-''}" ] && echo "isArray: Missing variable name." 1>&2 && return 1
    if [ -n "$BASH" ]; then
        # this is officially a hack, but it seems to be the best solution.  Yuck.
        declare -p ${1:-''} 2> /dev/null | grep 'declare \-a' >/dev/null && return 0
    fi
    return 1
}
