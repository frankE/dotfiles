#!/bin/bash
cd home
find * -maxdepth 0 | while read file; do rm "$HOME/.$file"; ln -s "`pwd`/$file" "$HOME/.$file"; done
