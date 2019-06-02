#!/bin/bash -e

# Install required packages
sudo apt install -y direnv

# fnm
DOWNLOAD_DIR="$(mktemp -d)"
wget -O "$DOWNLOAD_DIR"/fnm.zip https://github.com/Schniz/fnm/releases/download/v1.11.0/fnm-linux.zip
unzip -q "$DOWNLOAD_DIR"/fnm.zip -d "$DOWNLOAD_DIR"
mkdir -p ~/.fnm
mv -f "$DOWNLOAD_DIR"/fnm-linux/fnm ~/.fnm/fnm
chmod u+x ~/.fnm/fnm
rm -rf "$DOWNLOAD_DIR"
(
  PATH="$HOME/.fnm:$PATH"
  fnm install v10
  fnm use v10
)

# Enable ZSH configuration
ln -sfv ~/.dotfiles/zsh/zshrc.sh ~/.zshrc
