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


arrayAppend() {
    # Append to an array
    #
    # Usgae: arrayAppend NAME [element1 element2...]
    # Ouput: NAME set as global
    # Return: 0 if defined, 1 otherwise.
    #
    [ -z "${1:-}" ] && echo "createAppend: Missing array name." 1>&2 && return 1
    local var="${1:-''}"
    shift

    echo var ${var-''}
    echo varAT ${var[@]}
    echo args "$@"
    echo
    
    if [ -z "${1:-''}" ]; then
	true
    else
	eval "$var=(\"${var[@]}\"  \"$@\" )"
    fi
    
    return 0
}
