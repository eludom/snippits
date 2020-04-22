#! /bin/bash
# Demonstrat command chaning based on exit status of previous command

./good.sh && echo RUNNING NEXT COMMAND after good.sh
./bad.sh && echo RUNNING NEXT COMMAND AFTER bad.sh
