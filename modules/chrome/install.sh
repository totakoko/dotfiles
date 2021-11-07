# https://docs.fedoraproject.org/en-US/quick-docs/installing-chromium-or-google-chrome-browsers/
sudo dnf install -y fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable -y

# Set Chrome as the default web browser
xdg-settings set default-web-browser google-chrome.desktop

# Skip the first run prompt
mkdir -p "$HOME"/.config/google-chrome/
touch "$HOME"/.config/google-chrome/First\ Run

echo "
You can now start Chrome:
- login to your Google account to fetch extensions
- enable synchronization by entering the passphrase
- login to 1Password
"
