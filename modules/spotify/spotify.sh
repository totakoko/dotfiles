curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -

apt_repo files/spotify.list

apt_package spotify-client