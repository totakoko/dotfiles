apt_package zsh

if [[ ! -d ~/.oh-my-zsh ]]; then
  git clone -q --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Enable ZSH configuration
ln -sfv "$PWD"/files/.zshrc ~/.zshrc
ln -sfv "$PWD"/files/.aliases ~/.aliases

# Initialize z history
touch ~/.z

# Change the shell
apt_hook 'chsh -s /bin/zsh'






# Autre package direnv, z
