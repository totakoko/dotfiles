sudo dnf install -y zsh starship direnv

sudo chsh -s $(which zsh) $USER

if [[ ! -d "$HOME"/.oh-my-zsh ]]; then
 git clone -q --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$HOME"/.oh-my-zsh
fi

# Enable ZSH configuration
ln -sfv "$PWD"/files/.zshrc "$HOME"/.zshrc
ln -sfv "$PWD"/files/.aliases "$HOME"/.aliases

echo "A logout is required for the new shell to take effect."
