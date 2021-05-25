sudo cp files/*.conf /etc/systemd/
sudo cp files/system/* /etc/systemd/system

sudo systemctl enable monthly-apt-clean.timer
