#! /usr/bin/env python

"""
ipAddr - command line wrapper to ipAddr

By default, take a IPv4 addresses or CIDR blocks on command line.
Print out various selected fields using ipAddr.

Usage:

        ipAddr.py [--all] [--help] [options]  cidr [cidr...]

"""
import ipaddr
import optparse
import sys

__author__ = 'George Jones'
__maintainer__ = 'George Jones'
__email__ = 'gmj@pobox.com'
__version__ = '0.0.1'

# 
# ipAddr calculator
# 
#   
# 
# or simply
#
#   sort -u FOO
#
# in python

def p_error(msg=None):
    optp.print_help()
    if msg:
        optp.error(msg)
    sys.exit(1)

def parse_args(argv):
    global optp
    usage = """
        %prog [--all] [options]  cidr [cidr...]
        """

    # Parse arguments.
    optp = optparse.OptionParser(description=__doc__.strip(), version=__version__,
                             usage=usage)

    # Flag for all known netblock info
    optp.add_option('-A', '--all', help='Print all fields',
                action='store_true')

    # Flag for each 
    optp.add_option('-H', '--hostmask', help='print hostask',
                    action='store_true', default=True)

    optp.add_option('-N', '--netmask', help='print netask',
                    action='store_true', default=True)        

    optp.add_option('-I','--ip', help='print ip', action='store_true', default=True)

    optp.add_option('-K','--is_link_local', help='print is_link_local', action='store_true')

    optp.add_option('-L','--is_loopback', help='print is_loopback', action='store_true')

    optp.add_option('-M','--is_multicast', help='print is_multicast', action='store_true')

    optp.add_option('-P','--is_private', help='print is_private', action='store_true')

    optp.add_option('-R','--is_reserved', help='print is_reserved', action='store_true')

    optp.add_option('-U','--is_unspecified', help='print is_unspecified', action='store_true')

    optp.add_option('-S','--masked', help='print masked', action='store_true')

    optp.add_option('-X','--max_prefixlen', help='print max_prefixlen', action='store_true')

    optp.add_option('-W','--network', help='print network', action='store_true', default=True)

    optp.add_option('-O','--numhosts', help='print numhosts', action='store_true', default=True)

    optp.add_option('-F','--prefixlen', help='print prefixlen', action='store_true', default=True)

    optp.add_option('-B','--subnet', help='print subnet', action='store_true')

    optp.add_option('-T','--supernet', help='print supernet', action='store_true')

    optp.add_option('-V','--ipversion', help='print version', action='store_true', default=True)

    optp.add_option('--with_hostmask', help='print with_hostmask', action='store_true')

    optp.add_option('--with_netmask', help='print with_netmask', action='store_true')

    optp.add_option('--with_prefixlen', help='print with_prefixlen', action='store_true')

    
    # Parse arguments
    (opts, args) = optp.parse_args()

    return opts, args

def main():
    global opts
    opts, args = parse_args(sys.argv)

    # Check for conflicting options here

    if len(args) == 0:
        p_error('Must supply at least one IP address')

    for arg in args:

        try:
            net = ipaddr.IPv4Network(arg)       
        except (IPv4IpValidationError, IPv4NetmaskValidationError):
            pass

        print "network:", net


        if opts.all or opts.hostmask:
            print "  hostmask: ", net.hostmask

        if opts.all or opts.netmask:
            print "  netmask: ", net.netmask

        if opts.all or opts.ip:
            print "  ip:", net.ip

        if opts.all or opts.is_link_local:
            print "  is_link_local: ", net.is_link_local

        if opts.all or opts.is_loopback:
            print "  is_loopback: ", net.is_loopback

        if opts.all or opts.is_multicast:
            print "  is_multicast: ", net.is_multicast

        if opts.all or opts.is_private:
            print "  is_private: ", net.is_private

        if opts.all or opts.is_reserved:
            print "  is_reserved: ", net.is_reserved

        if opts.all or opts.is_unspecified:
            print "  is_unspecified: ", net.is_unspecified

        if opts.all or opts.max_prefixlen:
            print "  max_prefixlen: ", net.max_prefixlen

        if opts.all or opts.network:
            print "  network: ", net.network

        if opts.all or opts.numhosts:
            print "  numhosts: ", net.numhosts

        if opts.all or opts.prefixlen:
            print "  prefixlen: ", net.prefixlen

        if opts.all or opts.ipversion:
            print "  ipversion: ", net.version

        if opts.all or opts.with_prefixlen:
            print "  with_prefixlen: ", net.with_prefixlen
            
if __name__ == '__main__':
    main()

