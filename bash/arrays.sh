#! /bin/bash
# messing with arrays

# Declare an array
declare -a foo

function print_foo() {
    # List all elements of an array    
    for i in $(seq 0 $(( ${#foo[@]} - 1 ))); do
	echo foo[$i] is "${foo[$i]}" 
    done
}

function print_foo_length() {
    # Print length of array
    echo length of array is ${#foo[@]}
}

function foo_push() {
    this="${1}" 
    echo pusing "${this}" 
    # pop last element of foo
    foo[$((${#foo[@]}))]="${this}" 
}

function foo_pop() {
    # pop last element of foo
    unset foo[$((${#foo[@]}-1))]    
}



print_foo_length
print_foo

# Push onto end of an array
echo
echo pushing three elements
foo_push "one"
foo_push "Two" 
foo_push "THREE"
print_foo_length
print_foo


# Pop elements
echo
echo popping two elemenets
foo_pop
foo_pop
print_foo_length
print_foo





