sudo dnf install -y git

require_variable GIT_EMAIL "Git Email: "
require_variable GIT_NAME "Git Name: "

envsubst < "$PWD"/files/.gitconfig > "$HOME"/.gitconfig

cp -fv "$PWD"/files/.git{attributes,ignore} "$HOME"/
