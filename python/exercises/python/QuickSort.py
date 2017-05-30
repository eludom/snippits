# -*- coding: utf-8 -*-
"""
This class implements qucksort on arrays.

See https://en.wikipedia.org/wiki/Quicksort

#    algorithm quicksort(A, lo, hi) is#
#        if lo < hi then
#            p := partition(A, lo, hi)
#            quicksort(A, lo, p – 1)
#            quicksort(A, p + 1, hi)
#    
#    algorithm partition(A, lo, hi) is
#        pivot := A[hi]
#        i := lo - 1    
#        for j := lo to hi - 1 do
#            if A[j] ≤ pivot then
#                i := i + 1
#                swap A[i] with A[j]
#        swap A[i+1] with A[hi]
#        return i + 1
#    
"""

class QuickSort(object):
    """Quicksort implementaton"""

    def __init__(self, unsorted_array):
        """Initialize an array for quicksort"""
        self.array_to_sort = unsorted_array
        self.is_sorted = False
        print "starting array is", self.print_array()
        return None

    def print_array(self):
        """Print the [un]sorted array"""
        print self.array_to_sort

    def swap(self, swap_x, swap_y):
        """swap two elements of an array"""
        tmp = self.array_to_sort[swap_x]
        self.array_to_sort[swap_x] = self.array_to_sort[swap_y]
        self.array_to_sort[swap_y] = tmp

    def partition(self, lo_index, hi_index):
        """Parttiton the array"""        
        print "partition(%d,%d)" % (lo_index, hi_index)
        print "  array: ", self.array_to_sort

        # pivot on this value
        pivot = self.array_to_sort[hi_index]
        print "  pivot on hi_index ", hi_index, " pivot is ", pivot
        print

        # next place to put values less than pivot
        insert_here = lo_index - 1 

        for from_here in range(lo_index, hi_index):
            if self.array_to_sort[from_here] <= pivot:
                # move where to insert right one
                insert_here = insert_here + 1

                # put value less than pivot left of pivot value
                self.swap(insert_here, from_here)

        # finally, swap the pivot value itself to the end of the lis
        self.swap(insert_here+1, hi_index)

        # and report where we partitioned
        return insert_here + 1

    def quicksort(self, lo_index, hi_index):
        """Quicksort a slice of the array"""
        print "quicksort(%d,%d)" % (lo_index, hi_index)
        print "  array: ", self.array_to_sort
        print
        if lo_index < hi_index:
            partition_index = self.partition(lo_index, hi_index)
            self.quicksort(lo_index, partition_index - 1)
            self.quicksort(partition_index + 1, hi_index)
        self.is_sorted = True
