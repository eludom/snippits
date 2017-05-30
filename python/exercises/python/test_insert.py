#! /usr/bin/env python
"""Test sort functions"""

from InsertionSort import InsertionSort

# Read lines from a file

def main():
    """main function for testing"""

    with open("input.txt", "r") as input_file:
        input_array = []
        for line in input_file:
            input_array.append(line.strip())

    print "Insertion Sort:"
    sort_this = InsertionSort(input_array)
    print "  unsorted input_array is", sort_this.print_array()
    print "  sorted lines is", sort_this.sort_array()

if __name__ == '__main__':
    main()

