env_require_variable STS_OPT_HOME \
  && env_require_variable STS_LOCAL_HOME \
  || return 1

# Default version
local DEFAULT_VERSION="0.0.1"

# Package specific variables

info() {
  local version="${1:-$DEFAULT_VERSION}"
  echo "Package information for '$*'"
}

add() {
  local version="${1:-$DEFAULT_VERSION}"
  local opt_path="$STS_OPT_HOME/example/${version}"

  echo "Adding 'example:${version}'"

  mkdir -p "$opt_path"
  echo DOWNLOADED > "$opt_path/DOWNLOADED"
}

build() {
  local version="${1:-$DEFAULT_VERSION}"
  local opt_path="$STS_OPT_HOME/example/${version}"

  echo "Building 'example:${version}'"
}


install() {
  local version="${1:-$DEFAULT_VERSION}"
  echo "Installing '$*'"
}

uninstall() {
  echo "Uninstalling '$*'"
}

remove() {
  local version="${1:-$DEFAULT_VERSION}"
  echo "Removing '$*'"
}

clean() {
  local version="${1:-$DEFAULT_VERSION}"
  echo "Cleaning '$version'"
}

is_downloaded() {
  local version="${1:$DEFAULT_VERSION}"
  return 1
}

is_built() {
  return 1
}

is_installed() {
  return 1
}