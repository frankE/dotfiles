#!/bin/bash
git submodule init
git submodule update --recursive

cd home &&\
find .* -maxdepth 0 -name '.[^.]*' | while read file; do rm "$HOME/$file"; ln -s "`pwd`/$file" "$HOME/$file"; done
find * -maxdepth 0 | while read file; do rm "$HOME/$file"; ln -s "`pwd`/$file" "$HOME/$file"; done

cd ../config &&\
find .* -maxdepth 0 -name '.[^.]*' | while read file; do rm "$HOME/.config/$file"; ln -s "`pwd`/$file" "$HOME/.config/$file"; done
find * -maxdepth 0 | while read file; do rm "$HOME/.config/$file"; ln -s "`pwd`/$file" "$HOME/.config/$file"; done

