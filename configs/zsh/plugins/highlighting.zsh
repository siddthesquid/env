# Paths
ENV_HOME="${ENV_HOME:-$HOME/env}"
ENV_CONFIGS="${ENV_CONFIGS:-$ENV_HOME/configs}"
ENV_ZSH="${ENV_ZSH:-$ENV_CONFIGS/zsh}"
ENV_ZSH_EXTERNAL="${ENV_ZSH_EXTERNAL:-$ENV_ZSH/external}"

. $ENV_ZSH_EXTERNAL/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

declare -A ZSH_HIGHLIGHT_STYLES

# Default Styles
ZSH_HIGHLIGHT_STYLES[default]=fg=220,bold
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=196,bold

# Main Components
ZSH_HIGHLIGHT_STYLES[command]=fg=51,bold
ZSH_HIGHLIGHT_STYLES[argument]=fg=39
ZSH_HIGHLIGHT_STYLES[comment]=fg=82,bg=235
ZSH_HIGHLIGHT_STYLES[redirection]=fg=201,underline
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=198,bold
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=93

# Additional Components
ZSH_HIGHLIGHT_STYLES[precommand]=fg=123,underline
ZSH_HIGHLIGHT_STYLES[function]=fg=207,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=141,bold
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=99
ZSH_HIGHLIGHT_STYLES[path_prefix]=fg=159
ZSH_HIGHLIGHT_STYLES[path_approx]=fg=201,underline,bg=236
ZSH_HIGHLIGHT_STYLES[globbing]=fg=201,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=123,underline
ZSH_HIGHLIGHT_STYLES[command-substitution]=fg=87
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=93,bold
ZSH_HIGHLIGHT_STYLES[process-substitution]=fg=141
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=207
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=93,underline
ZSH_HIGHLIGHT_STYLES[named-fd]=fg=99,bold

export ZSH_HIGHLIGHT_STYLES