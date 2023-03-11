# sudo dnf updateinfo
# sudo dnf install git
# sudo dnf install nvim tmux zsh  
# sudo dnf install powerline-fonts
# sudo dnf install progress
# sudo dnf install python3-fabric
# sudo dnf install python3-pyyaml
# sudo dnf install fzf
# sudo dnf install openssh-askpass
#
# # interception-tools (caps2esc)
# sudo dnf copr enable fszymanski/interception-tools
# sudo dnf install interception-tools
# git clone https://gitlab.com/interception/linux/plugins/caps2esc.git ~/src/vendor/caps2esc
# mkdir ~/src/vendor/caps2esc/build
# cd ~/src/vendor/caps2esc/build
# cmake ..
# make -j 8
# sudo cp caps2esc /usr/local/bin
# cd - 
# sudo mkdir /etc/interception
# sudo cp udevmon.yaml /etc/interception
# sudo systemctl enable udevmon.service
# # End interception-tools
#
# curl -fLo ~/.local/bin/starship.tar.gz --create-dirs \
#   https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz
# tar -C ~/.local/bin -xaf ~/.local/bin/starship.tar.gz
# rm ~/.local/bin/starship.tar.gz

