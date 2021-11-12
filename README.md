# Personal Fedora System Configuration

> Some nice to have personal tweaks to improve a Fedora desktop environment.

## Bootstrap / Installation

- Once your Fedora system has booted:
```sh
wget -O /tmp/dotfiles.zip https://github.com/totakoko/dotfiles/archive/refs/heads/master.zip
tempDir=$(mktemp -d)
unzip /tmp/dotfiles.zip -d $tempDir
mv $tempDir/dotfiles-* ~/.dotfiles
rm -rf $tempDir
~/.dotfiles/system.sh integrate
$SHELL
```

- Copy the default configuration *config.default.sh* to *config.sh* then edit and adapt *config.sh* to your needs.
```sh
cp config.default.sh config.sh
vim config.sh
```

- Now install the modules, usually in this order:
```sh
system install fedora cinnamon
system install cinnamon-config flameshot peek
system install git development font-firacode shell vim zsh vscode
system install element mattermost slack
system install spotify steam
```

## Modules

### Base desktop

- [x] fedora: Basic Fedora desktop with cinnamon environment
- [x] cinnamon: Cinnamon desktop environment
- [x] cinnamon-config: configuration and shortcuts for the cinnamon environment
- [x] flameshot: Powerful yet simple to use screenshot software, allowing on-the-fly annotations
- [x] peek: Simple screen recorder with an easy to use interface

### Development

- [x] git
- [x] development
- [x] shell:
  - [fd](https://github.com/sharkdp/fd): A simple, fast and user-friendly alternative to 'find'
  - [ripgrep](https://github.com/BurntSushi/ripgrep): ripgrep recursively searches directories for a regex pattern while respecting your gitignore
- [x] vim: improved vim configuration for code editing
- [x] zsh
- [x] vscode

### Communication

- [x] element
- [x] mattermost
- [x] slack

### Miscellaneous

- [x] spotify
- [x] steam


## Development

- Start Gnome Boxes.
- Create a VM with a Fedora ISO.
- When the system is installed and rebooted, authorize your SSH key.
```sh
sshp $USER@192.168.122.9
ssh-copy-idp $USER@192.168.122.9
rsync -r --delete --exclude .git . $USER@192.168.122.9:.dotfiles
```
- On the VM, add the script to the PATH.
```sh
~/.dotfiles/system.sh integrate
```
- Restart the terminal then take a snapshot of the VM.
- Now you can test anything and restore the snapshot.
