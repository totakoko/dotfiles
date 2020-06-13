# these functions are exposed to the modules

apt_package() {
  echo $* >> "$SYSTEM_TMP"/apt_packages
}

apt_hook() {
  echo "$1" >> "$SYSTEM_TMP"/apt_hooks
}
