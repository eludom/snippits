#! /bin/bash

#
# Test bashArays.sh

#

#
# TODO List:
#   - Wrap this up as an init function.   Create a "thisWorks" assosiative array
#     indexed by the name of the function (hmm, maybe what I'm after is properties
#     associated with variables and functions ... lisp?).  Then functions can all do
#     something like
#
#         thisWorks[$myFunctionName] || \
#             "thisWorks: $myFunctioName not working here." 1>&2 && \
#              return 1
#

set -e; set -u; set +x; echo '#' `date;`

#
# Overall test setup
#
source bashArrays.sh

#
# Run bash array test functions
#
bashArrayTests() {
  arrayCreateTests
  isArrayTests 
  arrayAppendTests 
  reportTotals
}

#
# Report totals
#
pass=0
fail=0

reportTotals() {
  echo
  echo "pass: Total == $pass"
  echo "fail: Total == $fail"

  if [[ $pass -gt 0 && $fail -eq 0 ]]; then
      echo All passed.
      return 0
  else
      echo Failures.
      return $fail      
  fi
}


#
# arrayCreate tests
#


arrayCreateTests() {
    testClass="arrayCreate"
    
    testName="$testClass: Test missing array name"
    expectedResults="arrayCreate: Missing array name."
    # --- Run test ---
    arrayCreate || true
    
    if [ -z "$arrayError" ]; then	
	results="Array create failed to return an error"
    else
	results="$arrayError"
    fi
    
     # --- Report Results ---
    arrayTest "$testName" "$results" "$expectedResults" && ((pass+=1)) || ((fail+=1))

    #
    # TODO use this as the model for error handling
    #
    # TODO change all funtions to set arrayError
    #
    # TODO change all tests to set results to arrayError if error else array value



    testName="$testClass: Create an empty array"
    expectedResults="NONE"    
    # --- Run test ---
    arrayCreate foo  || true

    if [ -z "$arrayError" ]; then
	results="NONE${foo[@]:-}"
    else
	results="$arrayError"
    fi
    
     # --- Report Results ---
    arrayTest "$testName" "$results" "$expectedResults" && ((pass+=1)) || ((fail+=1))


    testName="$testClass: Create an array with several elements"
    expectedResults="bar baz"    
    # --- Run test ---
    arrayCreate foo bar baz || true

    if [ -z "$arrayError" ]; then
	results=${foo[@]} 
    else
	results="$arrayError"
    fi
    
     # --- Report Results ---
    arrayTest "$testName" "$results" "$expectedResults" && ((pass+=1)) || ((fail+=1))



}



arrayCreateTestsOld() {
    testClass="arrayCreate"

# TODO
#     Capture errors something like this
#
#     err=$(arrayCreate 2>&1) && echo true || echo false
#
#     Rework all my error tests using this.  use err for actual value if failed
    
    # --- Test Setup ---
    testName="$testClass: Create an array with several elements"
    expectedResults="bar baz"
    # --- Run test ---
    errMsg=$(arrayCreate foo bar baz 2>&1)
    echo "foo is ${foo[@]-}"
    # --- Report Results ---
    arrayTest "$testName: errMsg=/$errMsg/" foo "$expectedResults" && ((pass+=1)) || ((fail+=1))

    return 0
}


#
# isArray tests
#

isArrayTests() {
    testClass="isArray"

    # --- Test Setup ---
    testName="$testClass: test isArray wtih missing array name"
    expectedResults="isArray: Missing array name."
    # --- Run test ---

    isArray || true

    if [ -z "$arrayError" ]; then	
	results="isArray failed to return an error"
    else
	results="$arrayError"
    fi

    # --- Report Results ---
    arrayTest "$testName" "$results" "$expectedResults" && ((pass+=1)) || ((fail+=1))    



    # --- Test Setup ---
    testName="$testClass: test isArray on empty string"
    expectedResults="isArray: Missing array name."
    # --- Run test ---
    isArray "" || true

    if [ -z "$arrayError" ]; then	
	results="isArray failed to return an error"
    else
	results="$arrayError"
    fi

    # --- Report Results ---
    arrayTest "$testName" "$results" "$expectedResults" && ((pass+=1)) || ((fail+=1))        

    
    # --- Test Setup ---
    testName="$testClass: test isArray on string"
    expectedResults="isArray: foox is not an array."
    unset foox
    foox="foox"
    # --- Run test ---
    isArray foox || true

    if [ -z "$arrayError" ]; then	
	results="isArray failed to return an error"
    else
	results="$arrayError"
    fi

    # --- Report Results ---
    arrayTest "$testName" "$results" "$expectedResults" && ((pass+=1)) || ((fail+=1))        

    # --- Test Setup ---
    testName="$testClass: test isArray on an actual array"
    expectedResults="NONE"
    foo=(foo bar)
    # --- Run test ---

    isArray foo

    if [ -z "$arrayError" ]; then	
	results="NONE"
    else
	results="$arrayError"
    fi

    # --- Report Results ---
    arrayTest "$testName" "$results" "$expectedResults" && ((pass+=1)) || ((fail+=1))        




    return 0
}


arrayAppendTests() {
    testClass="arrayAppend"

    # --- Test Setup ---
    testName="$testClass: Test missing array name"
    expectedResults="arrayAppend: Missing array name."
    # --- Run test ---
    arrayAppend || true
    if [ -z "$arrayError" ]; then	
	results="isArray failed to return an error"
    else
	results="$arrayError"
    fi
    # --- Report Results ---
    arrayTest "$testName" "$results" "$expectedResults" && ((pass+=1)) || ((fail+=1))    

    # --- Test Setup ---
    testName="$testClass: Attempt to append one element to a non-arrray"
    expectedResults="arrayAppend: foo is not an array "
    unset qux
    # --- Run test ---
    arrayCreate qux
    arrayAppend qux bar || true

    if [ -z "$arrayError" ]; then	
	results="isArray failed to return an error"
    else
	results="$arrayError"
    fi

    # --- Report Results ---
    arrayTest "$testName" "$results" "$expectedResults" && ((pass+=1)) || ((fail+=1))    
    

    return 0    
    
    # --- Test Setup ---
    testName="$testClass: Append one element to existing empty array"
    foo=()
    expectedResults="bar"
    # --- Run test ---
    arrayAppend foo bar || true
    actualResults="${foo[@]-}"
    #echo results $results
    # --- Report Results ---
    arrayTest "$testName: foo=/$actualResults/" foo $expectedResults  && ((pass+=1)) || ((fail+=1))
    
    # --- Test Setup ---
    testName="$testClass: Append one element to existing non-empty array"
    foo=(foo)
    expectedResults="foo bar"
    # --- Run test ---
    arrayAppend foo bar || true
    actualResults="${foo[@]-}"
    #echo results $results
    # --- Report Results ---
    arrayTest "$testName: foo=/$actualResults/" foo $expectedResults  && ((pass+=1)) || ((fail+=1))

    return 0
}
    


