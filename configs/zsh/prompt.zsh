NEWLINE=$'\n'

# %B ... %b: bold
# %U ... %u: underline
# %F{color} ... %f: foreground color
# %~: current directory relative to $HOME
PROMPT="${NEWLINE} %B%U%F{51}%~%f%u %F{blue}$%f %b"