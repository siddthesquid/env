# Paths
ENV_HOME="${ENV_HOME:-$HOME/env}"
ENV_CONFIGS="${ENV_CONFIGS:-$ENV_HOME/configs}"
ENV_ZSH="${ENV_ZSH:-$ENV_CONFIGS/zsh}"
ENV_ZSH_EXTERNAL="${ENV_ZSH_EXTERNAL:-$ENV_ZSH/external}"

. $ENV_ZSH_EXTERNAL/zsh-autosuggestions/zsh-autosuggestions.zsh