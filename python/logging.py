#! /usr/bin/env python3
#
# Define standard logging functions
#

import sys
import os
import time

# Class of log levels, in increasing level of verbosity
class LogLevels:
    none, error, warn, info, debug = range(5)

# default log level
logLevel = LogLevels.info

#
# Helper functions
#
def get_progname():
    """Get program name"""

    try:
        progname = os.path.basename(__file__)
    except NameError:
        progname = "no_program_name"

    return progname

def get_gmt_asc():
    """Return current time as ascii string """
    return(time.asctime(time.gmtime()))


def format_log_message(message, type):
    """Format a log message"""
    return(get_gmt_asc() + " " + get_progname() + ": " + type + ": " + message + "\n")

#
# Logging functions
#
def error(message):
    """Print an warrning message"""

    if logLevel >= LogLevels.error:
        sys.stderr.write(format_log_message(message, "error"))

def warn(message):
    """Print an warrning message"""

    if logLevel >= LogLevels.warn:
        sys.stderr.write(format_log_message(message, "warning"))

def info(message):
    """Print an info message"""

    if logLevel >= LogLevels.info:
        sys.stdout.write(format_log_message(message, "info"))

def debug(message):
    """Print an warrning message"""

    if logLevel >= LogLevels.debug:
        sys.stderr.write(format_log_message(message, "debug"))

def main():
    info("This is an info message")
    warn("This is a warning message")
    error("This is an error message")
    debug("This is an debug message")


#main()
