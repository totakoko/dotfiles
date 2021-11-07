# Use french repositories
if ! grep -q '&country=fr' /etc/yum.repos.d/fedora.repo; then
  sudo sed -ri '/\[fedora\]/,/^$/ s/^metalink=.*/&\&country=fr/' /etc/yum.repos.d/fedora.repo
fi

sudo cp -fv "$PWD"/files/dnf.conf /etc/dnf/dnf.conf

# Enable npmfusion repositories
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf upgrade -y

# Ensure that we won't insert unwanted characters (e.g. unbreakable space with Alt Gr + space)
localectl set-x11-keymap fr

echo "A logout is required to ensure that the keymap is loaded"
