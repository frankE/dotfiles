# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$HOME/go/bin:$PATH"
EXPORT EDITOR="nvim"
# export TERMINAL="alacritty"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/android/cmdline-tools/bin:$PATH"
export LANG="de_DE.UTF8"

export QSYS_ROOTDIR="/home/frank/intelFPGA_lite/23.1std/quartus/sopc_builder/bin"
