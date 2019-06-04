#!/bin/bash -e

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# Install required packages
sudo apt install -y direnv htop chromium-browser

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

# Copy configuration into the home folder
sources_home_dir="$script_dir"/home
output_dir="$HOME"
OLDIFS=$IFS
IFS=$'\n'
sources_files=($(find "$sources_home_dir" -type f -printf "%P\n"))
for file_path in ${sources_files[@]}; do
  mkdir -p "$output_dir/$(dirname "$file_path")"
  ln -sfv "$sources_home_dir/$file_path" "$output_dir/$file_path"
done
IFS=$OLDIFS

# Enable ZSH configuration
ln -sfv ~/.dotfiles/zsh/zshrc.sh ~/.zshrc
