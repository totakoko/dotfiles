#!/bin/bash -e

# Set Chromium as the default browser
xdg-settings set default-web-browser chromium-browser.desktop

# Disable mouse acceleration
sudo mkdir -p /etc/X11/xorg.conf.d
sudo tee /etc/X11/xorg.conf.d/50-mouse-acceleration.conf <<EOF >/dev/null
Section "InputClass"
  Identifier "Mouse"
  MatchIsPointer "yes"
  Option "AccelerationProfile" "-1"
  Option "AccelerationScheme" "none"
  Option "AccelSpeed" "-1"
EndSection
EOF

dconf write /org/nemo/desktop/show-desktop-icons false

dconf write /org/cinnamon/desktop-effects false

# Disable workspaces OSD
dconf write /org/cinnamon/workspace-osd-visible false

# Scrolling two-finger-scrolling or edge-scrolling
dconf write /org/cinnamon/settings-daemon/peripherals/touchpad/scroll-method "'two-finger-scrolling'"

dconf write /org/cinnamon/desktop/interface/clock-show-date true
dconf write /org/cinnamon/desktop/wm/preferences/focus-mode "'mouse'"
dconf write /org/cinnamon/desktop/wm/preferences/num-workspaces 6
dconf write /org/cinnamon/desktop/wm/preferences/mouse-button-modifier "'alt'"

# Keyboard bindings

dconf write /org/cinnamon/desktop/keybindings/wm/switch-to-workspace-1 "['<Super>ampersand']"
dconf write /org/cinnamon/desktop/keybindings/wm/switch-to-workspace-2 "['<Super>eacute']"
dconf write /org/cinnamon/desktop/keybindings/wm/switch-to-workspace-3 "['<Super>quotedbl']"
dconf write /org/cinnamon/desktop/keybindings/wm/switch-to-workspace-4 "['<Super>apostrophe']"
dconf write /org/cinnamon/desktop/keybindings/wm/switch-to-workspace-5 "['<Super>parenleft']"
dconf write /org/cinnamon/desktop/keybindings/wm/switch-to-workspace-6 "['<Super>minus']"

dconf write /org/cinnamon/desktop/keybindings/wm/move-to-workspace-1 "['<Shift><Super>1']"
dconf write /org/cinnamon/desktop/keybindings/wm/move-to-workspace-2 "['<Shift><Super>2']"
dconf write /org/cinnamon/desktop/keybindings/wm/move-to-workspace-3 "['<Shift><Super>3']"
dconf write /org/cinnamon/desktop/keybindings/wm/move-to-workspace-4 "['<Shift><Super>4']"
dconf write /org/cinnamon/desktop/keybindings/wm/move-to-workspace-5 "['<Shift><Super>5']"
dconf write /org/cinnamon/desktop/keybindings/wm/move-to-workspace-6 "['<Shift><Super>6']"

dconf write /org/cinnamon/desktop/keybindings/wm/switch-to-workspace-left "@as []"
dconf write /org/cinnamon/desktop/keybindings/wm/switch-to-workspace-right "@as []"

dconf write /org/cinnamon/desktop/keybindings/wm/show-desktop "@as []"
dconf write /org/cinnamon/desktop/keybindings/wm/close "['<Shift><Super>q']"
dconf write /org/cinnamon/desktop/keybindings/wm/toggle-fullscreen "['<Super>f']"

dconf write /org/cinnamon/desktop/keybindings/wm/panel-run-dialog "['<Super>D']"
dconf write /org/cinnamon/desktop/keybindings/media-keys/terminal "['<Super>Return','<Super>t']"
dconf write /org/cinnamon/desktop/keybindings/media-keys/www "['<XF86WWW','<Super>c']"

dconf write /org/cinnamon/favorite-apps "['chromium-browser.desktop', 'gnome-terminal.desktop', 'nemo.desktop']"

# Gnome Terminal configuration
terminalProfileId=$(dconf read /org/gnome/terminal/legacy/profiles:/default | tr -d \')

# Disable terminal transparent background
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/use-theme-transparency false

# Allow unlimited scroll
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/scrollback-unlimited true

# Hyper Snazzy theme (see https://github.com/tobark/hyper-snazzy-gnome-terminal/blob/master/hyper-snazzy.sh)
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/palette "['#282a36', '#ff5c57', '#5af78e', '#f3f99d', '#57c7ff', '#ff6ac1', '#9aedfe', '#f1f1f0', '#686868', '#ff5c57', '#5af78e', '#f3f99d', '#57c7ff', '#ff6ac1', '#9aedfe', '#eff0eb']"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/background-color "'#282a36'"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/foreground-color "'#eff0eb'"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/bold-color "'#eff0eb'"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/bold-color-same-as-fg "true"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/use-theme-colors "false"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/use-theme-background "false"

# Hide the menubar
dconf write /org/gnome/terminal/legacy/default-show-menubar false

# Disable Gnome help shortcut (F1)
dconf write /org/gnome/terminal/legacy/keybindings/help "'disabled'"

