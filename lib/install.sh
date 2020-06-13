installModules() {
  local modules=$*

  touch "$SYSTEM_TMP"/apt_packages
  touch "$SYSTEM_TMP"/apt_hooks

  for module in $modules; do
    echo "> Install module: $module"

    if [[ ! -d "$SYSTEM_MODULES"/$module ]]; then
      panic "Module '$module' not found. Make sure the directory '"$SYSTEM_MODULES"/$module' exists"
    fi
    # run in a subshell to load specific environment variables
    (
      cd "$SYSTEM_MODULES"/$module
      source "$SYSTEM_HOME"/lib/modules-api.sh
      source "$SYSTEM_MODULES"/$module/*.sh
    )
  done

  apt_packages=$(cat "$SYSTEM_TMP"/apt_packages)
  if [[ ! -z "$apt_packages" ]]; then
    echo "> Installing APT packages"
    sudo apt-get update -qq
    sudo apt-get install -yqq $apt_packages
  fi

  apt_hooks=$(cat "$SYSTEM_TMP"/apt_hooks)
  if [[ ! -z "$apt_hooks" ]]; then
    echo "> Running APT hooks"
    eval "$apt_hooks"
  fi
}

