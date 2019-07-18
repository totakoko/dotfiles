#!/bin/bash -e

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg
sudo install -o root -g root -m 644 /tmp/microsoft.gpg /etc/apt/trusted.gpg.d/
rm /tmp/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y code


# List extensions with `code --list-extensions`

i() {
  code --install-extension $1 --force
}


#
## Development
#

# EditorConfig
i editorconfig.editorconfig

# ESLint : lint Javascript
i dbaeumer.vscode-eslint

# TSLint
i ms-vscode.vscode-typescript-tslint-plugin

# Sass syntax highlighting
i syler.sass-indented

# Vue syntax highlighting
i octref.vetur

# Stylus syntax highlighting
i sysoev.language-stylus

# Go
i ms-vscode.go

# Peer programming
i ms-vsliveshare.vsliveshare


#
## Misc
#

# One Dark Pro theme
i zhuangtongfa.material-theme

# Adds a duplicate action for files and folders
i mrmlnc.vscode-duplicate

# Adds a confirm dialog when CTRL + Q
i artdiniz.quitcontrol-vscode
