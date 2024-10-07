#!/usr/bin/env bash

bigScreen="desc:Samsung Electric Company C49RG9x HNTR200541"
builtin="eDP-1"

hyprctl dispatch movetoworkspacesilent,1 firefox
hyprctl dispatch movetoworkspacesilent,1 jetbrains-phpstorm
hyprctl dispatch movetoworkspacesilent,1 gnome-terminal-server
hyprctl dispatch movetoworkspacesilent,1 mattermost
hyprctl dispatch movetoworkspacesilent,2 thunderbird 
hyprctl dispatch movetoworkspacesilent,2 org.keepassxs.KeePassXC
hyprctl dispatch movetoworkspacesilent,4 Spotify
hyprctl dispatch movetoworkspacesilent,6 discord

hyprctl dispatch moveworkspacetomonitor 1 1
hyprctl dispatch moveworkspacetomonitor 2 1
hyprctl dispatch moveworkspacetomonitor 3 1
hyprctl dispatch moveworkspacetomonitor 4 1
hyprctl dispatch moveworkspacetomonitor 5 1
hyprctl dispatch moveworkspacetomonitor 6 1
