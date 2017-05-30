"""
This classs implements insertion sort on an unsorted array.


Operations:
  - sortedArray = (unsortedArray)
"""

class InsertionSort(object):
    """My Hash Library"""

    def __init__(self, unsortedArray):
        """Sort an unsorted array"""
        self.array = unsortedArray
        print "starting array is", self.print_array()
        return None

    def print_array(self):
        """Print the array"""
        print self.array

    def sort_array(self):
        """Sort the array"""
        array_range = range(1, len(self.array))
        for i in array_range:
            j = i
            while j > 0 and self.array[j-1] > self.array[j]:
                # swap
                save = self.array[j]
                self.array[j] = self.array[j-1]
                self.array[j-1] = save
                j = j - 1

# Pseudo-Code
# for i = 1 to length(A)
#     j = i
#     while j > 0 and A[j-1] > A[j]
#         swap A[j] and A[j-1]
#         j = j - 1
#     end while
# end for

        return self.array

