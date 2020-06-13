integrate() {
  mkdir -pv "$SYSTEM_BIN" "$SYSTEM_RC"
  ln -sfv "$SYSTEM_HOME"/system.sh "$HOME"/bin/system

  cp -fv "$SYSTEM_HOME"/lib/templates/.systemrc/*.sh "$HOME"/.systemrc/
  cp -fv "$SYSTEM_HOME"/lib/templates/bashrc "$HOME"/.bashrc
}
