#! /usr/bin/env python
# From https://stackoverflow.com/questions/16198546/get-exit-code-and-stderr-from-subprocess-call/16198668

import subprocess

cmd_args = ['ls', '-a']

pipes = subprocess.Popen(cmd_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
std_out, std_err = pipes.communicate(timeout=3)

if pipes.returncode != 0:
    # an error happened!
    print("problem2")
    err_msg = "%s. Code: %s" % (std_err.strip(), pipes.returncode)
    raise Exception(err_msg)
elif len(std_err):
    # return code is 0 (no error), but we may want to
    # do something with the info on std_err
    # i.e. logger.warning(std_err)
    print("stderr: " + str(std_err))

# do whatever you want with std_out
print("stdout: " + str(std_out))
# i.e. json.loads(std_out)
