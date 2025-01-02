#!/usr/bin/env bash

hyprctl dispatch exec [workspace 1 silent] phpstorm
hyprctl dispatch exec [workspace 1 silent] firefox
hyprctl dispatch exec [workspace 1 silent] flatpak run com.mattermost.Desktop
hyprctl dispatch exec [workspace 1 silent] kitty
hyprctl dispatch exec [workspace 2 silent] thunderbird 
hyprctl dispatch exec [workspace 2 silent] keepassxc
hyprctl dispatch exec [workspace 3 silent] flatpak run com.spotify.Client

