#!/usr/bin/env bash
bigScreen="desc:BNQ BenQ EW3270U Y1K00197019"
smallScreen="desc:LG Electronics 24EA53 0x01010101"
builtin="eDP-1"

hyprctl dispatch movetoworkspacesilent 1,firefox
hyprctl dispatch movetoworkspacesilent 2,thunderbird
hyprctl dispatch movetoworkspacesilent 2,org.keepassxc.KeePassXC
hyprctl dispatch movetoworkspacesilent 3,gnome-terminal-server
hyprctl dispatch movetoworkspacesilent 4,Spotify
hyprctl dispatch movetoworkspacesilent 6,discord

hyprctl dispatch moveworkspacetomonitor 1 $bigScreen
hyprctl dispatch moveworkspacetomonitor 2 $bigScreen
hyprctl dispatch moveworkspacetomonitor 3 $bigScreen
hyprctl dispatch moveworkspacetomonitor 4 $bigScreen
hyprctl dispatch moveworkspacetomonitor 5 $bigScreen
hyprctl dispatch moveworkspacetomonitor 6 $smallScreen
