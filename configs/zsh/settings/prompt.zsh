NEWLINE=$'\n'

setopt prompt_subst

# %B ... %b: bold
# %U ... %u: underline
# %F{color} ... %f: foreground color
# %~: current directory relative to $HOME
# PROMPT="${NEWLINE} %B%U%F{165}%~%f%u %F{163}$%f %b"
PROMPT='${NEWLINE}%B%U%F{165}%~%f%u %F{163}$%f %b'
