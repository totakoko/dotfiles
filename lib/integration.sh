integrate() {
  mkdir -pv "$SYSTEM_BIN" "$SYSTEM_RC"
  ln -sfv "$SYSTEM_HOME"/system.sh "$SYSTEM_BIN"/system
  ln -svf "$SYSTEM_HOME"/lib/templates/.systemrc/*.sh "$SYSTEM_RC"/
  ln -svf "$SYSTEM_HOME"/lib/templates/bashrc "$HOME"/.bashrc
}
