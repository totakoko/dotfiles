# https://docs.fedoraproject.org/en-US/quick-docs/installing-chromium-or-google-chrome-browsers/
sudo dnf install -y fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable -y

# Set Chrome as the default web browser
xdg-settings set default-web-browser google-chrome.desktop

# Skip the first run prompt
mkdir -p "$HOME"/.config/google-chrome/
touch "$HOME"/.config/google-chrome/First\ Run

if [[ ! -f "$HOME"/.config/google-chrome/Local\ State ]]; then
  # Start and stop chrome to initialize $HOME/.config/google-chrome/Local State
  google-chrome &
  sleep 1
  kill %%
  sleep 1 # wait a bit for chrome to fully save its file
fi

# Disable Hardware Media Key Handling so that Play/Pause goes to Spotify
if ! grep -q 'hardware-media-key-handling@2' "$HOME"/.config/google-chrome/Local\ State; then
  echo 'Disabling hardware media key'
  if grep -q 'enabled_labs_experiments' "$HOME"/.config/google-chrome/Local\ State; then
    # append
    sed -i 's/enabled_labs_experiments":\[/enabled_labs_experiments":["hardware-media-key-handling@2",/' "$HOME"/.config/google-chrome/Local\ State
  else
    # create
    sed --debug -i 's/"browser":{/"browser":{"enabled_labs_experiments":["hardware-media-key-handling@2"],/' "$HOME"/.config/google-chrome/Local\ State
  fi
fi

echo "
You can now start Chrome:
- login to your Google account to fetch extensions
- enable synchronization by entering the passphrase
- login to 1Password
"
