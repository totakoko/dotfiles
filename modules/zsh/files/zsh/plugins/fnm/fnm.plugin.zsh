[[ -d "$HOME/.fnm" ]] || return 0
PATH=$HOME/.fnm:$PATH
eval "$(fnm env --multi)"
