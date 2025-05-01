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
mkdir -p $HOME/.tmux
mkdir -p $HOME/.config

# List of links to be created
declare -A links
links=(
  ["$HOME/.gitconfig"]="$env_dir/configs/git/.gitconfig"
  ["$HOME/.gitignore"]="$env_dir/configs/git/.gitignore"
  ["$HOME/.tmux.conf"]="$env_dir/configs/tmux/.tmux.conf"
  ["$HOME/.tmuxinator"]="$env_dir/configs/tmux/.tmuxinator"
  ["$HOME/.vimrc"]="$env_dir/configs/neovim/.vimrc"
  ["$HOME/.ripgreprc"]="$env_dir/configs/ripgrep/.ripgreprc"
  ["$HOME/.tmux/external"]="$env_dir/configs/tmux/external"
  ["$HOME/.tmux/settings"]="$env_dir/configs/tmux/settings"
  ["$HOME/.config/nvim"]="$env_dir/configs/neovim/nvim"
  ["$HOME/.config/alacritty"]="$env_dir/configs/alacritty"
  ["$HOME/.config/sketchybar"]="$env_dir/configs/sketchybar"
  ["$HOME/.config/aerospace"]="$env_dir/configs/aerospace"
)

# Create links
for source in "${(@k)links}"; do
  create_link "$source" "${links[$source]}"
done
