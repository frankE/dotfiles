#!/usr/bin/bash
unset LD_LIBRARY_PATH
/usr/bin/gnome-terminal -- /usr/bin/nvim -c "$1" "$2" > /dev/null 2>&1
