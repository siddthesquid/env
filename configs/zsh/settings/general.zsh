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

autoload -Uz compinit
compinit

autoload bashcompinit
bashcompinit

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
