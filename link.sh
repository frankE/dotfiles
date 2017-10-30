#!/bin/bash
find .* -maxdepth 0 -type f | while read file; do rm "$HOME/$file"; ln -s "`pwd`/$file" "$HOME/$file"; done
rm $HOME/.vim -r
ln -s `pwd`/.vim $HOME/.vim
