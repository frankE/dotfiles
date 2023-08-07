#!/bin/bash

if [[ ! -d "$HOME/.local/share/tmux/plugins/tpm" ]]; then
   git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm 
fi
