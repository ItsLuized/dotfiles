#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'
# Script for Ubuntu based distros
# This script is to install zsh, oh-my-zsh and powerlevel10k (my prefered theme)
printf "${GREEN}Starting install script${NC}\n"
sleep 1s
sudo apt install curl git

# Install zsh
printf "${GREEN}Installing Zsh and oh-my-zsh${NC}\n"
sleep 1s
sudo apt install zsh -y

# Install oh-my-zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

printf "${GREEN}Zsh and oh-my-zsh installed${NC}\n"
sleep 1s

# Install NVM and put needed lines at end of zsh
printf "${GREEN}Installing NVM, node v16 and YARN${NC}\n"
sleep 1s
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

echo '' >> ~/.zshrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.zshrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.zshrc

source ~/.zsh
nvm install v16
npm -g install yarn
printf "${GREEN}Finished installing NVM, node v16 and YARN${NC}\n"
sleep 1s

# Install Powerlevel10k
printf "${GREEN}Installing Powerlevel10k${NC}\n"
sleep 1s
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Change the zsh theme on .zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
printf "${GREEN}Finished installing powerlevel10k${NC}\n"
sleep 1s

# Final command. This should lead to config powerlevel10k
exec zsh

# ynn111121121y1yy