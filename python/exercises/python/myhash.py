"""
This classs implements a set of functions for implementing a hash

Operations:
  - set(hash, value)
  - value = get(hash)
"""

class MyHash(object):
    """Provide functions to set and get a hashed key/vlue pairs
    """

    def __init__(self, name):
        """For now, use positionally corresponding arrays to store hash keys and values"""
        self.hash_keys = []    # array of hash values (strings)
        self.hash_values = []  # array of hash values
        self.hash_name = name

    def set(self, hash_key, hash_value):
        """Set hash value

        Return True if value was already present
        Return False if value was not present
        """
        found = False

        # Linear search, update existing if found
        for i in range(len(self.hash_keys)):
            if self.hash_keys[i] == hash_key:
                self.hash_values[i] = hash_value
                found = True
                return True

        # Append to end, no ordering
        if not found:
            self.hash_keys.append(hash_key)
            self.hash_values.append(hash_value)

        return False

    def get(self, hash_key):
        """Get hash value for key

        Return value if found or None
        """

        # Linear search for matching element
        for i in range(len(self.hash_keys)):
            if self.hash_keys[i] == hash_key:
                return self.hash_values[i]

        return None

    def binary_search(self, find_this_key, low_index, high_index):
        """Binary search for the value of a particulary hash key"""

        print "binary_search ", find_this_key, low_index, high_index

        if (high_index < low_index):
            print "return None"
            return None
        if high_index - low_index < 0:
            print "return None 2"           
            return None
        elif high_index - low_index == 0 and self.hash_keys[low_index] == find_this_key:
            print "Returning ", self.hash_values[low_index]
            return self.hash_values[low_index]
            
        else:
            middle_index = (high_index - low_index)/2

            value_found_in_left_half = self.binary_search(find_this_key, low_index, middle_index-1)

            if value_found_in_left_half != None:
                print "RETURNING LEFT HALF VALUE", value_found_in_left_half
                return value_found_in_left_half

            print "SEARCHING RIGHT HALF, MIDDLE ", middle_index, " HIGH ", high_index


            return self.binary_search(find_this_key, middle_index+1, high_index)

        print "return None 3"                   
        return None


    def get_fast(self, find_this_key):
        """Get hash value for key.  Faster than 'get'"""

        return self.binary_search(find_this_key, 0, len(self.hash_keys) - 1)


