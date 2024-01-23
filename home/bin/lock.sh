grim -o $(hyprctl -j monitors | jq -r '.[] | select(.focused) | .name') /tmp/screen.png

convert /tmp/screen.png -scale 25% -blur 0x4 -scale 400% -fill black -colorize 50% /tmp/screen.png
[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png

swaylock -s fill -i /tmp/screen.png
