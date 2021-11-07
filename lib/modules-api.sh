# these functions are exposed to the modules

require_variable() {
  local variableName=$1
  local prompt=$2
  while [[ -z ${!variableName} ]]; do
    read -e -p $prompt $variableName
  done
  export $variableName
}
