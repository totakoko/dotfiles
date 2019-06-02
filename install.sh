#!/bin/bash -e

# Install required packages
sudo apt install -y direnv

# Enable ZSH configuration
ln -sfv ~/.dotfiles/zsh/zshrc.sh ~/.zshrc
