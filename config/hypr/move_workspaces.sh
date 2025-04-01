#!/usr/bin/env bash
bigScreen="desc:BNQ BenQ EW3270U Y1K00197019"
smallScreen="desc:LG Electronics 24EA53 0x01010101"
builtin="eDP-1"

hyprctl dispatch movetoworkspacesilent 1,class:org.mozilla.firefox
hyprctl dispatch movetoworkspacesilent 2,class:net.thunderbird.Thunderbird
hyprctl dispatch movetoworkspacesilent 2,class:org.keepassxc.KeePassXC
hyprctl dispatch movetoworkspacesilent 3,class:kitty
hyprctl dispatch movetoworkspacesilent 4,class:Spotify
hyprctl dispatch movetoworkspacesilent 6,class:discord

hyprctl dispatch moveworkspacetomonitor 1 $bigScreen
hyprctl dispatch moveworkspacetomonitor 2 $bigScreen
hyprctl dispatch moveworkspacetomonitor 3 $bigScreen
hyprctl dispatch moveworkspacetomonitor 4 $bigScreen
hyprctl dispatch moveworkspacetomonitor 5 $bigScreen
hyprctl dispatch moveworkspacetomonitor 6 $smallScreen
