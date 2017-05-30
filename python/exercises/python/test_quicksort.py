#! /usr/bin/env python

"""Test sort functions"""

from QuickSort import QuickSort

# Read lines from a file

def main():
    """main function for testing"""

    with open("input.txt", "r") as input_file:
        input_array = []
        for line in input_file:
            input_array.append(int(line.strip()))

    print "Quick Sort:"
    sort_this = QuickSort(input_array)
    print "  unsorted input_array is", sort_this.print_array()
    sort_this.quicksort(0, len(input_array)-1)
    print "  sorted input_array is", sort_this.print_array()

if __name__ == '__main__':
    main()

