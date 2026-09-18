#!/usr/bin/env bash
# Hyprland 0.55+ : `hyprctl dispatch` takes a single Lua expression.
#
#   movetoworkspacesilent WS,WIN  ->  hl.dsp.window.move({ workspace = WS, follow = false, window = WIN })
#   moveworkspacetomonitor WS MON ->  hl.dsp.workspace.move({ workspace = WS, monitor = MON })
#
# `follow = false` is what the old `silent` suffix did: move the window without
# dragging focus along with it.

# NOTE: these two were already unused in the original script.
bigScreen="desc:Samsung Electric Company C49RG9x HNTR200541"
builtin="eDP-1"

hyprctl dispatch 'hl.dsp.window.move({ workspace = 1, follow = false, window = "class:org.mozilla.firefox" })'
hyprctl dispatch 'hl.dsp.window.move({ workspace = 1, follow = false, window = "class:kitty" })'
hyprctl dispatch 'hl.dsp.window.move({ workspace = 1, follow = false, window = "class:mattermost" })'
hyprctl dispatch 'hl.dsp.window.move({ workspace = 2, follow = false, window = "class:net.thunderbird.Thunderbird" })'
hyprctl dispatch 'hl.dsp.window.move({ workspace = 2, follow = false, window = "class:org.keepassxc.KeePassXC" })'
hyprctl dispatch 'hl.dsp.window.move({ workspace = 4, follow = false, window = "class:Spotify" })'
hyprctl dispatch 'hl.dsp.window.move({ workspace = 6, follow = false, window = "class:discord" })'

for ws in 1 2 3 4 5 6; do
    hyprctl dispatch "hl.dsp.workspace.move({ workspace = $ws, monitor = 1 })"
done
