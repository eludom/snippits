#! /bin/bash

set -u -e

# http://rosettacode.org/wiki/Associative_array/Creation#UNIX_Shell

declare -a arglist=""

declare -A hash
hash=( [key1]=val1 [key2]=val2 )
hash[key3]=val3
echo "${hash[key3]}"

#for i in "${!array[@]}"
#do
#  echo "key  : $i"
#  echo "value: ${array[$i]}"
#done

# http://stackoverflow.com/questions/6149679/bash-need-some-help-with-multidimensional-associative-arrays

#arg["stack-size"]=("s:","stack-size:","Stack size","[0-9"]

# The following associateve arrays define options
# There should be one entry for each option, indexed by shortname.
# If there is no shortname, just use a unique value (the long name?)
#
declare -A optShortNames	# short names of options
declare -A optLongNames		# long nmaes of options
declare -A optDefault		# Default value, or blank.
declare -A optValidateRE	# Validation regular expression, or blank.
declare -A optHelp		# Option help sring.

optShortNames["v"]="v"
optLongNames["v"]="verbose"
optDefault["v"]=""
optValidateRE["v"]=""
optHelp["v"]="Be verbose"


optShortNames["s"]="s:"
optLongNames["s"]="stacksize:"
optDefault["s"]="s999"
optValidateRE["s"]="^[0-9]+$"
optHelp["s"]="Specifiy stack size.  Integer.  Default: None."


declare -p optShortNames
declare -p optLongNames
declare -p optValidateRE
declare -p optHelp

for bar in ${!optShortNames[@]}; do
    echo
    echo bar $bar
        
    echo optShortNames ${optShortNames[$bar]}
    echo optLongNames ${optLongNames[$bar]}
    echo optDfault ${optDefault[$bar]}
    echo optValidateRE ${optValidateRE[$bar]}
    echo optHelp ${optHelp[$bar]}

    if [[ ${optDefault[$bar]} =~ ${optValidateRE[$bar]} ]]; then  
	echo  valid default value;
    else
	echo  bad default value;
    fi
    
done
