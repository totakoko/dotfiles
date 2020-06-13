#!/bin/bash -e

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg
sudo install -o root -g root -m 644 /tmp/microsoft.gpg /etc/apt/trusted.gpg.d/
rm /tmp/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install -y apt-transport-https
apt_package code

# List extensions with `code --list-extensions`

apt_hook "
ln -sfv "$PWD"/files/keybindings.json ~/.config/Code/User/keybindings.json
ln -sfv "$PWD"/files/settings.json ~/.config/Code/User/settings.json

i() {
  code --install-extension "'$1'" --force
}

#
## Language highlighting
#

# Vue
i octref.vetur

# Angular
i Angular.ng-template

# Stylus
i sysoev.language-stylus

# Sass syntax highlighting
i syler.sass-indented

# Go
i ms-vscode.go

# Rust
i rust-lang.rust


#
## Lint / Formatting
#

# EditorConfig
i editorconfig.editorconfig

# ESLint : lint Javascript
i dbaeumer.vscode-eslint


#
## Misc
#

# Peer programming
i ms-vsliveshare.vsliveshare

# One Dark Pro theme
i zhuangtongfa.material-theme

# Adds a duplicate action for files and folders
i mrmlnc.vscode-duplicate

# Adds a confirm dialog when CTRL + Q
i artdiniz.quitcontrol-vscode
"
