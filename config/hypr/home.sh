#!/usr/bin/env bash
# Hyprland 0.55+ : `hyprctl dispatch` takes a single Lua expression.
# exec [workspace N silent] CMD  ->  hl.dsp.exec_cmd("CMD", { workspace = "N silent" })

hyprctl dispatch 'hl.dsp.exec_cmd("firefox", { workspace = "1 silent" })'
hyprctl dispatch 'hl.dsp.exec_cmd("thunderbird", { workspace = "2 silent" })'
hyprctl dispatch 'hl.dsp.exec_cmd("keepassxc", { workspace = "2 silent" })'
hyprctl dispatch 'hl.dsp.exec_cmd("kitty", { workspace = "3 silent" })'
hyprctl dispatch 'hl.dsp.exec_cmd("flatpak run com.spotify.Client", { workspace = "4 silent" })'
hyprctl dispatch 'hl.dsp.exec_cmd("discord", { workspace = "6 silent" })'
