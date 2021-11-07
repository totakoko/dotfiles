sudo dnf install -y vim git

if [[ ! -d ~/.cache/dein/repos/github.com/Shougo/dein.vim ]]; then
  git clone -q --depth 1 https://github.com/Shougo/dein.vim ~/.cache/dein/repos/github.com/Shougo/dein.vim
fi

ln -sfv "$PWD"/files/vimrc ~/.vimrc

vim -N -u ~/.vimrc -c "try | call dein#install() | finally | qall! | endtry" -U NONE -i NONE -V1 -e -s
