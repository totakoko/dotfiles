## Configure keyboard shortcuts

# Hide desktop icons
dconf write /org/nemo/desktop/show-desktop-icons false

# Disable animations when changing workspaces
dconf write /org/cinnamon/muffin/desktop-effects false

# Scrolling two-finger-scrolling or edge-scrolling
dconf write /org/cinnamon/settings-daemon/peripherals/touchpad/scroll-method "'two-finger-scrolling'"

dconf write /org/cinnamon/desktop/interface/clock-show-date true
dconf write /org/cinnamon/desktop/wm/preferences/focus-mode "'mouse'"
dconf write /org/cinnamon/desktop/wm/preferences/num-workspaces 6
dconf write /org/cinnamon/desktop/wm/preferences/mouse-button-modifier "'alt'"

# Disable workspaces OSD
dconf write /org/cinnamon/workspace-osd-visible false

# Keyboard bindings

# Workspaces management
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

# Clear the default apps
# defaults ['firefox.desktop', 'cinnamon-settings.desktop', 'org.gnome.Terminal.desktop', 'nemo.desktop']>
dconf write /org/cinnamon/favorite-apps "['cinnamon-settings.desktop']"

# Disable the countdown when exiting cinnamon
dconf write /org/cinnamon/cinnamon-session/quit-delay-toggle false

# Gnome Terminal configuration
#terminalProfileId=$(dconf read /org/gnome/terminal/legacy/profiles:/default | tr -d \')
terminalProfileId=$(dconf list /org/gnome/terminal/legacy/profiles:/ | grep '^:' | head -1 | tr -d :/)

# Disable terminal transparent background
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/use-theme-transparency false

# Allow unlimited scroll
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/scrollback-unlimited true

# OneDark theme (see https://github.com/denysdovhan/one-gnome-terminal/blob/master/one-dark.sh)
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/palette "['#000000', '#e06c75', '#98c379', '#d19a66', '#61afef', '#c678dd', '#56b6c2', '#abb2bf', '#5c6370', '#e06c75', '#98c379', '#d19a66', '#61afef', '#c678dd', '#56b6c2', '#ffffff']"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/background-color "'#282c34'"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/foreground-color "'#abb2bf'"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/bold-color "'#ABB2BF'"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/bold-color-same-as-fg "true"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/use-theme-colors "false"
dconf write /org/gnome/terminal/legacy/profiles:/:${terminalProfileId}/use-theme-background "false"

# Hide the menubar
dconf write /org/gnome/terminal/legacy/default-show-menubar false

# Disable Gnome help shortcut (F1)
dconf write /org/gnome/terminal/legacy/keybindings/help "'disabled'"

# Set the task bar height
dconf write /org/cinnamon/panels-height "['1:${CINNAMON_PANEL_HEIGHT:-30}']"

# Since Fedora 37, fix the Super key not working
dconf write /org/gnome/libgnomekbd/keyboard/options "['altwin\taltwin:hyper_win']"

# Disable grouping windows by application
#sed -ri '/group-apps":/,// s/(value":).*/\1 false/' "$HOME"/.cinnamon/configs/grouped-window-list@cinnamon.org/2.json

# Disable shortcuts with super + number to open applications (conflicts with changing workspace)
#sed -ri '/super-num-hotkeys":/,// s/(value":).*/\1 false/' "$HOME"/.cinnamon/configs/grouped-window-list@cinnamon.org/2.json

# Display the window title in the task bar
# Options:
#   "None": 1,
#   "Application name": 2,
#   "Window title": 3,
#   "Window title (only for the focused window)": 4
#sed -ri '/title-display":/,// s/(value":).*/\1 3/' "$HOME"/.cinnamon/configs/grouped-window-list@cinnamon.org/2.json

# Don't show recent files
sed -ri '/show-recents":/,// s/(value":).*/\1 false/' "$HOME"/.cinnamon/configs/menu@cinnamon.org/19.json
