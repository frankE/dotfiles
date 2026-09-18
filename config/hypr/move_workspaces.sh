#!/usr/bin/env bash
bigScreen="desc:BNQ BenQ EW3270U Y1K00197019"
smallScreen="desc:LG Electronics 24EA53 0x01010101"
builtin="eDP-1"

hyprctl dispatch 'hl.dsp.window.move({ workspace = 1, follow = false, window = "class:org.mozilla.firefox" })'
hyprctl dispatch 'hl.dsp.window.move({ workspace = 2, follow = false, window = "class:net.thunderbird.Thunderbird" })'
hyprctl dispatch 'hl.dsp.window.move({ workspace = 2, follow = false, window = "class:org.keepassxc.KeePassXC" })'
hyprctl dispatch 'hl.dsp.window.move({ workspace = 4, follow = false, window = "class:Spotify" })'
hyprctl dispatch 'hl.dsp.window.move({ workspace = 6, follow = false, window = "class:discord" })'


for ws in 1 2 3 4; do
    hyprctl dispatch "hl.dsp.workspace.move({ workspace = $ws, monitor = 1 })"
done
hyprctl dispatch "hl.dsp.workspace.move({ workspace = $ws, monitor = 2 })"
