# Paths
STS_ENV_CONFIGS="$STS_ENV_HOME/configs"
STS_ENV_CONFIGS_ZSH="$STS_ENV_CONFIGS/zsh"
STS_ENV_ZSH_EXTERNAL="$STS_ENV_CONFIGS_ZSH/external"

. $STS_ENV_ZSH_EXTERNAL/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down