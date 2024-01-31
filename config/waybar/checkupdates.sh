#!/usr/bin/env bash

UPDATES=$(dnf check-update -y | wc -l)
((UPDATES=$UPDATES-1))
if [ $UPDATES -gt 0 ]; then
    echo Updates available
    echo $UPDATES
    echo has-updates
else
    echo ✔
    echo updated
    echo 
fi
