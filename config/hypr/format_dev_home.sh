#!/usr/bin/env bash

bigScreen="desc:Samsung Electric Company C49RG9x HNTR200541"
builtin="eDP-1"

hyprctl dispatch movetoworkspacesilent 1,class:org.mozilla.firefox
hyprctl dispatch movetoworkspacesilent 1,class:kitty
hyprctl dispatch movetoworkspacesilent 1,class:mattermost
hyprctl dispatch movetoworkspacesilent 2,class:net.thunderbird.Thunderbird
hyprctl dispatch movetoworkspacesilent 2,class:org.keepassxc.KeePassXC
hyprctl dispatch movetoworkspacesilent 4,class:Spotify
hyprctl dispatch movetoworkspacesilent 6,class:discord

hyprctl dispatch moveworkspacetomonitor 1 1
hyprctl dispatch moveworkspacetomonitor 2 1
hyprctl dispatch moveworkspacetomonitor 3 1
hyprctl dispatch moveworkspacetomonitor 4 1
hyprctl dispatch moveworkspacetomonitor 5 1
hyprctl dispatch moveworkspacetomonitor 6 1
