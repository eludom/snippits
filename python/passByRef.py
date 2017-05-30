def someSub(thing):
    print "Thing is: ", thing
    thing=42
    print "Thing is: ", thing    
    return 4242


def main():
    foo=1
    someSub(foo)
    print "foo is ", foo


main()
