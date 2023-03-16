os_get() {
  local os
  os="$(uname -s)"
  case "${os}" in
    Linux*)     echo "linux" ;;
    Darwin*)    echo "macos" ;;
    CYGWIN*)    echo "cygwin" ;;
    MINGW*)     echo "mingw" ;;
    *)          echo "unknown" ;;
  esac
}

os_is_linux() {
  [ "$(os_get)" = "linux" ]
}

os_is_macos() {
  [ "$(os_get)" = "macos" ]
}

os_is_macos_arm() {
  os_is_macos && [ "$(uname -m)" = "arm64" ]
}

os_is_macos_intel() {
  os_is_macos && [ "$(uname -m)" = "x86_64" ]
}

os_is_cygwin() {
  [ "$(os_get)" = "cygwin" ]
}

os_is_mingw() {
  [ "$(os_get)" = "mingw" ]
}

os_is_windows() {
  os_is_cygwin || os_is_mingw
}