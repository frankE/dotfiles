#!/usr/bin/env bash

bigScreen="desc:Samsung"
smallScreen="desc:LG Electronics 24EA53"
builtin="eDP-1"

hyprctl dispatch movetoworkspacesilent,1 jetbrains-phpstorm
hyprctl dispatch movetoworkspacesilent,1 firefox
hyprctl dispatch movetoworkspacesilent,1 mattermost
hyprctl dispatch movetoworkspacesilent,1 gnome-terminal-server
hyprctl dispatch movetoworkspacesilent,2 thunderbird 
hyprctl dispatch movetoworkspacesilent,2 org.keepassxs.KeePassXC
hyprctl dispatch movetoworkspacesilent,3 Spotify

hyprctl dispatch moveworkspacetomonitor 1 $bigScreen
hyprctl dispatch moveworkspacetomonitor 2 $bigScreen
hyprctl dispatch moveworkspacetomonitor 3 $bigScreen
