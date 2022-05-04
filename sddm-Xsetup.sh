#!/bin/sh
# Our new Xsetup script, which execute the original Xsetup script.

. /usr/share/sddm/scripts/Xsetup

# xhost allow `root`, so that sunlogin can open XDisplay with user `root` before the actual user session started.
xhost +SI:localuser:root
