# Paths
ENV_HOME="${ENV_HOME:-$HOME/env}"
ENV_CONFIGS="${ENV_CONFIGS:-$ENV_HOME/configs}"
ENV_ZSH="${ENV_ZSH:-$ENV_CONFIGS/zsh}"
ENV_ZSH_EXTERNAL="${ENV_ZSH_EXTERNAL:-$ENV_ZSH/external}"

. $ENV_ZSH_EXTERNAL/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down