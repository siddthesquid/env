# Export editors
export EDITOR="nvim"
export VISUAL="nvim"

# use zsh vim mode
bindkey -v '^?' backward-delete-char

# History
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_no_store
setopt append_history
setopt hist_expand

# Updates editor information when the keymap changes.
.zshrc.cursor() {
  case $KEYMAP$ZLE_STATE in
    # block
    vicmd*) print -n "\e[2 q" ;;
    # bar
    *insert*) print -n "\e[6 q" ;;
    # underbar
    *) print -n "\e[4 q" ;;
  esac
}
autoload -Uz add-zle-hook-widget
add-zle-hook-widget zle-keymap-select .zshrc.cursor

# Some suggestions from https://thevaluable.dev/zsh-install-configure-mouseless/

# Edit command line with vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd Q edit-command-line

# Text objects
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# Surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround
