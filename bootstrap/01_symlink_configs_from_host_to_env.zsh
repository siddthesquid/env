#!/usr/bin/env zsh

local env_dir=${STS_ENV_HOME:-$HOME/env}

create_link() {
  local source_path="$1"
  local target_path="$2"
  local display_source="${source_path/$HOME/~}"
  local display_target="${target_path/$HOME/~}"

  if [[ -L $source_path && $(readlink $source_path) == $target_path ]]; then
    echo "$display_source is already linked to $display_target"
  elif [[ -e $source_path ]]; then
    echo "$display_source already exists"
  elif [[ ! -e $target_path ]]; then
    echo "$display_target does not exist"
  else
    ln -s $target_path $source_path
    echo "Link created: $display_source -> $display_target"
  fi
}

# Make directories
local zsh_dir="$env_dir/configs/zsh/local"
mkdir -p $zsh_dir

# List of links to be created
declare -A links
links=(
  ["$zsh_dir/.zshenv"]="$HOME/.zshenv"
  ["$zsh_dir/.zprofile"]="$HOME/.zprofile"
  ["$zsh_dir/.zshrc"]="$HOME/.zshrc"
  ["$zsh_dir/.zlogin"]="$HOME/.zlogin"
  ["$zsh_dir/.zlogout"]="$HOME/.zlogout"
)

# Create links
for source in "${(@k)links}"; do
  create_link "$source" "${links[$source]}"
done
