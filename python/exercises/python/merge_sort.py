"""
This function implements merge sort on an unsorted array

Operations:
  - sortArray
"""

def merge_sort(sort_this):
    """Implement merge sort for an array"""

    # if array is empty or one elelemnt, just return it

    if len(sort_this) <= 1:
        # print "EMPTY OR ONE, returning:", sort_this
        return sort_this

    if len(sort_this) == 2:

        if sort_this[0] < sort_this[1]:
            # print "TWO ELEMENTS, return sort_this:", sort_this            
            return_this = list(sort_this)
            # print "TWO ELEMENTS, return_this:", return_this            
        else:
            # print "TWO ELEMENTS, return reverse sort_this:", sort_this                        
            return_this = list(sort_this)
            return_this.reverse()
            # print "TWO ELEMENTS, return sort_this.reverse:", return_this
            

        # print "TWO ELEMENTS, sort_this:", sort_this
        # print "TWO ELEMENTS, returning:", return_this
        return return_this

    # halve the unsorted arrays

    middle = len(sort_this)/2
    left_half = sort_this[:middle]
    right_half = sort_this[middle:]

    # print
    # print "LEFT_HALF", left_half
    # print "RIGHT_HALF", right_half

    # sort halves

    left_half_sorted = merge_sort(left_half)
    right_half_sorted = merge_sort(right_half)

    # print "LEFT_HALF_SORTED", left_half_sorted
    # print "RIGHT_HALF_SORTED", right_half_sorted

    # merge sorted halves
    merged = []
    while len(merged) < len(sort_this):
        # deal with exhaustion of either half
        if left_half_sorted and not right_half_sorted:
            merged += left_half_sorted
        elif right_half_sorted and not left_half_sorted:
            merged += right_half_sorted
        else:
            if left_half_sorted[0] < right_half_sorted[0]:
                merged.append(left_half_sorted.pop(0))
            else:
                merged.append(right_half_sorted.pop(0))

    # print "MERGED, returning:", merged
    return merged

