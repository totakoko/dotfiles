installModules() {
  local modules=$*

  for module in $modules; do
    echo "> Install module: $module"

    if [[ ! -d "$SYSTEM_MODULES"/$module ]]; then
      panic "Module '$module' not found. Make sure the directory '"$SYSTEM_MODULES"/$module' exists"
    fi
    # run in a subshell to load specific environment variables
    (
      cd "$SYSTEM_MODULES"/$module
      source "$SYSTEM_HOME"/lib/modules-api.sh
      source "$SYSTEM_MODULES"/$module/install.sh
    )
  done
}

