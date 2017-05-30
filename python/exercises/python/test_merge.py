#! /usr/bin/env python
"""Test sort functions"""

# from insertion_sort import insertion_sort
from merge_sort import merge_sort

# Read lines from a file

def main():
    """main function for testing"""

    with open("input.txt", "r") as input_file:
        input_array = []
        for line in input_file:
            input_array.append(line.strip())

    # print "Insertion Sort:"
    # sortThis = insertionSort(input_array)
    # print "  unsorted input_array is", sortThis.printArray()
    # print "  sorted lines is", sortThis.sortArray()

    print "Merge Sort:"
    print "  unsorted input_array is", input_array
    print "  sorted array is", merge_sort(input_array)


if __name__ == '__main__':
    main()

