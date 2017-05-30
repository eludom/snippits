import unittest
from foobarbaz import Foo # code from module you're testing


class SimpleTestCase(unittest.TestCase):

    def setUp(self):
        """Call before every test case."""
        self.foo = Foo()
        self.file = open( "blah", "r" )

    def tearDown(self):
        """Call after every test case."""
        self.file.close()

    def testA(self):
        """Test case A. note that all test method names must begin with 'test.'"""
        assert self.foo.bar() == 544, "bar() not calculating values correctly"

#    def testB(self):
#        """test case B"""
#        assert self.foo+self.foo == 34, "can't add Foo instances"

    def testC(self):
        """test case C"""
        assert self.foo.baz() == "blah", "baz() not returning blah correctly"


class OtherTestCase(unittest.TestCase):

    

    def setUp(self):
        self.blahblah = "blah"
        print "OtherTestCase.setUp"

    def tearDown(self):
        print "OtherTestCase.tearDown"        

    def testBlah(self):
        assert self.blahblah == "blah", "blah isn't blahing blahing correctly"


if __name__ == "__main__":
    unittest.main() # run all tests
