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
mkdir -p $HOME/.config
mkdir -p $HOME/.config/git
mkdir -p $HOME/.config/ripgrep
mkdir -p $HOME/.config/alacritty
mkdir -p $HOME/.config/aerospace


# List of links to be created
declare -A links
links=(

  # Core
  ["$HOME/.config/tmux"]="$env_dir/configs/tmux"
  ["$HOME/.config/nvim"]="$env_dir/configs/nvim"

  # Misc
  ["$HOME/.config/git/ignore"]="$env_dir/configs/misc/gitignore"
  ["$HOME/.config/git/config"]="$env_dir/configs/misc/gitconfig"
  ["$HOME/.config/ripgrep/ripgreprc"]="$env_dir/configs/misc/ripgreprc"
  ["$HOME/.config/alacritty/alacritty.toml"]="$env_dir/configs/misc/alacritty.toml"
  ["$HOME/.config/aerospace/aerospace.toml"]="$env_dir/configs/misc/aerospace.toml"
)

# Create links
for source in "${(@k)links}"; do
  create_link "$source" "${links[$source]}"
done
