wget -O/tmp/mattermost.rpm https://releases.mattermost.com/desktop/5.0.1/mattermost-desktop-5.0.1-linux-x86_64.rpm
sudo dnf install -y /tmp/mattermost.rpm
rm /tmp/mattermost.rpm

# Launch to initialize the local config
DISPLAY= mattermost-desktop || true

# Disable autostart
sed -ri 's/(autostart":) true/\1 false/' "$HOME"/.config/Mattermost/config.json
