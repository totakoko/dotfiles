sudo dnf install -y flameshot

mkdir -p "$HOME"/.config/flameshot

export SAVE_PATH="$(xdg-user-dir PICTURES)"/screenshots
envsubst < "$PWD"/files/flameshot.ini > "$HOME"/.config/flameshot/flameshot.ini

# Disable gnome screenshot shortcut
dconf write /org/cinnamon/desktop/keybindings/media-keys/screenshot "@as []"

# Configure the Print Screen key to use Flameshot
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/flameshot/binding  "['Print']"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/flameshot/command  "'flameshot gui'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/flameshot/name  "'Flameshot Screenshot'"

# TODO append to custom-list?
dconf write /org/cinnamon/desktop/keybindings/custom-list  "['flameshot']"
