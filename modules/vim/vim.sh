apt_package vim git

if [[ ! -d ~/.cache/dein/repos/github.com/Shougo/dein.vim ]]; then
  git clone -q --depth 1 https://github.com/Shougo/dein.vim ~/.cache/dein/repos/github.com/Shougo/dein.vim
fi

cp files/vimrc ~/.vimrc

apt_hook 'vim -N -u ~/.vimrc -c "try | call dein#install() | finally | qall! | endtry" -U NONE -i NONE -V1 -e -s'
