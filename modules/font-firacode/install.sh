wget -O /tmp/font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
mkdir -p "$HOME"/.local/share/fonts/firacode
unzip -u /tmp/font.zip -d "$HOME"/.local/share/fonts/firacode
rm "$HOME"/.local/share/fonts/firacode/*Windows*
fc-cache -v
