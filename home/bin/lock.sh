#!/usr/bin/env bash
LOCKCMD='swaylock -s fill -c 000000'
IMAGES=''
hyprctl -j monitors | jq -r '.[] | select(.focused) |.name' | ( while read line ; do
    grim -o "$line" "/tmp/$line.png"
    convert "/tmp/$line.png" -scale 25% -blur 0x4 -scale 400% -fill black -colorize 50% "/tmp/$line.png"
    [[ -f $1 ]] && convert "/tmp/$line.png" $1 -gravity center -composite -matte "/tmp/$line.png"
    IMAGES="$IMAGES -i \"$line\":\"/tmp/$line.png\""
done
CMD="$LOCKCMD $IMAGES"
$CMD )
