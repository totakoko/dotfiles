apt_package flameshot

mkdir -p ~/.config/Dharkael
cp -f files/flameshot.ini ~/.config/Dharkael/flameshot.ini
cp -f files/screenshot.sh ~/bin/screenshot


# Configure the print screen key to use Flameshot
dconf write /org/cinnamon/desktop/keybindings/custom-list "['screenshot']"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/screenshot/name "'Screenshot (with flameshot)'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/screenshot/command "'screenshot'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/screenshot/binding "['Print']"
