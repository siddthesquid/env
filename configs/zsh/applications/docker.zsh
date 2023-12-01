if [[ $commands[docker] ]] && os_is_macos; then
  local etc=/Applications/Docker.app/Contents/Resources/etc
  . $etc/docker.zsh-completion
  . $etc/docker-compose.zsh-completion

  compdef _docker docker
  compdef _docker_compose docker-compose
fi