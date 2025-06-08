#!/usr/bin/env bash

UPDATES=$(pacman -Quq)
UPDATE_COUNT=$(echo $UPDATES | wc -w)
if [ $UPDATE_COUNT -gt 0 ]; then
    TEXT=""
    for U in $UPDATES; do
        TEXT="$TEXT\\n$U"
    done
    echo "{\"text\": \"$UPDATE_COUNT Update(s) available\", \"tooltip\": \"$TEXT\"}"
else
    echo "{\"text\": \"✔ Up to date\", \"tooltip\": \"\"}"
fi

