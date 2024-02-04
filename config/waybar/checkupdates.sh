#!/usr/bin/env bash

UPDATES=$(dnf check-update -y -q| wc -l)
((UPDATES=$UPDATES))
if [ $UPDATES -gt 0 ]; then
    echo Updates available
    echo $UPDATES
    echo has-updates
else
    echo ✔
    echo updated
    echo 
fi
