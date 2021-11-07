#!/bin/bash -e

# set -x

# disable alias (like rm='nocorrect rm -i')
unalias -a

SYSTEM_HOME="$( cd "$( dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd )"
SYSTEM_BIN="$(systemd-path user-binaries)"
SYSTEM_RC="$HOME/.systemrc"
SYSTEM_CONFIG="$SYSTEM_HOME/config.sh"
SYSTEM_MODULES="$SYSTEM_HOME/modules"
SYSTEM_TMP="/tmp/system"

source "$SYSTEM_HOME"/lib/helpers.sh
source "$SYSTEM_HOME"/lib/integration.sh
source "$SYSTEM_HOME"/lib/install.sh

if [[ -f "$SYSTEM_CONFIG" ]]; then
  source "$SYSTEM_CONFIG"
fi

# don't execute main if the script is being sourced
if [[ -n $ZSH_EVAL_CONTEXT && $ZSH_EVAL_CONTEXT =~ :file$ || -n $BASH_VERSION && $0 != "$BASH_SOURCE" ]]; then
  return 0
fi

rm -rf "$SYSTEM_TMP"
mkdir -p "$SYSTEM_TMP"

showUsage() {
  cat >&2 <<EOF
Usage:
  system install <module> [<module>...] : install the specified module(s) on the system
  system integrate : integrate System with the shell PATH
EOF

  exit 1
}

command=$1
shift || true
case $command in
  install)
    if [[ -z $1 ]]; then
      showUsage
    fi
    installModules $*
    ;;
  integrate)
    integrate
    ;;
  *) showUsage;;
esac
