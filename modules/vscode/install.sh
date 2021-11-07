# https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
# dnf check-update
sudo dnf install -y code

i() {
  code --install-extension "$1" --force
}

# Vue
# i octref.vetur
i johnsoncodehk.volar
# Angular
i Angular.ng-template
# Stylus
# i sysoev.language-stylus
# Sass syntax highlighting
i syler.sass-indented
# Go
# i golang.Go
# Rust
# i rust-lang.rust

#
## Lint / Formatting
#

# EditorConfig
i editorconfig.editorconfig
# ESLint : lint Javascript
i dbaeumer.vscode-eslint
# Highlight bad characters
i wengerk.highlight-bad-chars

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


ln -sfv "$PWD"/files/keybindings.json "$HOME"/.config/Code/User/keybindings.json
ln -sfv "$PWD"/files/settings.json "$HOME"/.config/Code/User/settings.json
