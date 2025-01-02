#!/usr/bin/env bash

hyprctl dispatch exec [workspace 1 silent] firefox
hyprctl dispatch exec [workspace 2 silent] thunderbird 
hyprctl dispatch exec [workspace 2 silent] keepassxc
hyprctl dispatch exec [workspace 3 silent] kitty
hyprctl dispatch exec [workspace 4 silent] flatpak run com.spotify.Client
hyprctl dispatch exec [workspace 6 silent] ~/Discord/Discord
