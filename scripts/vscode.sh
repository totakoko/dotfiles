#!/bin/bash -e

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
i robinbentley.sass-indented

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
