#!/usr/bin/env bash

bigScreen="desc:BNQ BenQ EW3270U Y1K00197019"
smallScreen="desc:LG Electronics 24EA53"
builtin="eDP-1"

hyprctl dispatch movetoworkspacesilent,1 firefox
hyprctl dispatch movetoworkspacesilent,2 jetbrains-phpstorm
hyprctl dispatch movetoworkspacesilent,2 gnome-terminal-server
hyprctl dispatch movetoworkspacesilent,6 mattermost
hyprctl dispatch movetoworkspacesilent,3 thunderbird 
hyprctl dispatch movetoworkspacesilent,3 org.keepassxs.KeePassXC
hyprctl dispatch movetoworkspacesilent,3 Spotify

hyprctl dispatch moveworkspacetomonitor 1 $bigScreen
hyprctl dispatch moveworkspacetomonitor 2 $bigScreen
hyprctl dispatch moveworkspacetomonitor 3 $bigScreen
hyprctl dispatch moveworkspacetomonitor 6 $smallScreen
