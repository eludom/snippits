#!/bin/bash
# save current packages for dpgk/apt
dpkg --get-selections > packages.lst
