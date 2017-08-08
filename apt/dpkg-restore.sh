dpkg --merge-avail <(apt-cache dumpavail)
dpkg --clear-selections
dpkg --set-selections < packages.lst
apt-get dselect-upgrade
