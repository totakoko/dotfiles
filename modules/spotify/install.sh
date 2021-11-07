sudo dnf install -y lpf-spotify-client

sudo usermod -aG pkg-build $USER
DISPLAY= sg pkg-build "lpf approve spotify-client; lpf build spotify-client"
sudo dnf install /var/lib/lpf/rpms/spotify-client/spotify-client-*.rpm

require_variable SPOTIFY_USERNAME "Spotify username (lowercase): "

mkdir -p "$HOME"/.config/spotify/Users/${SPOTIFY_USERNAME}-user
ln -sfv "$PWD"/prefs "$HOME"/.config/spotify/Users/${SPOTIFY_USERNAME}-user/prefs
