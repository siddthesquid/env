NEWLINE=$'\n'

precmd_conda_info() {
  if [[ -n $CONDA_DEFAULT_ENV ]]; then
    CONDA_ENV="[${CONDA_DEFAULT_ENV:t}] "
  else
    CONDA_ENV=""
  fi
}

precmd_functions+=( precmd_conda_info )
setopt prompt_subst

# %B ... %b: bold
# %U ... %u: underline
# %F{color} ... %f: foreground color
# %~: current directory relative to $HOME
# PROMPT="${NEWLINE} %B%U%F{165}%~%f%u %F{163}$%f %b"
PROMPT='${NEWLINE}%F{cyan}$CONDA_ENV%f%B%U%F{165}%~%f%u %F{163}$%f %b'