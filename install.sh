#!/bin/bash -e

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# Install required packages (Debian 10)
packages=()

# Script requirements
packages+=(dconf-cli git git-lfs)

# Desktop
packages+=(blueman flameshot pavucontrol peek vlc)

# Development
packages+=(direnv docker docker-compose vim zsh)

# System
packages+=(dconf-editor htop inotify-tools ntpsec strace stress-ng wireshark)

sudo apt install -y ${packages[@]}


# Oh my ZSH
if [[ ! -e ~/.oh-my-zsh ]]; then
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi


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


function copy_link_tree {
  local source_dir="$1"
  local output_dir="$2"
  local commands_prefix=$([[ $3 ]] && echo "sudo" || "")
  local OLDIFS=$IFS
  IFS=$'\n'
  sources_files=($(find "$source_dir" -type f -printf "%P\n"))
  for file_path in ${sources_files[@]}; do
    $commands_prefix mkdir -p "$output_dir/$(dirname "$file_path")"
    $commands_prefix ln -sfv "$source_dir/$file_path" "$output_dir/$file_path"
  done
  IFS=$OLDIFS
}
# Copy configuration into the user home and / folders
copy_link_tree "$script_dir"/home "$HOME"
copy_link_tree "$script_dir"/root "" true

# Run other scripts
for script in $(ls -1 "$script_dir"/scripts); do
  "$script_dir/scripts/$script"
done

# Enable ZSH configuration
ln -sfv ~/.dotfiles/zsh/zshrc.sh ~/.zshrc

# Initialize z history
touch ~/.z

# Allow using docker without root privileges
sudo usermod -aG docker $USER

# Change the shell
chsh -s /bin/zsh
