#!/bin/bash
# Script for Ubuntu based distros
# This script is to install zsh, oh-my-zsh and powerlevel10k (my prefered theme)

# Install zsh
sudo apt install zsh -y

# Install zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Change the zsh theme on .zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g'

# Final command. This should lead to config powerlevel10k
exec zsh