apps=""

# postgresql client (psql)
apps="$apps postgresql"

apps="$apps htop cpulimit strace"

# disabled at install
apps="$apps openssh-server"

sudo dnf install -y $apps

cp -fv "$PWD"/files/.editorconfig "$HOME"/
