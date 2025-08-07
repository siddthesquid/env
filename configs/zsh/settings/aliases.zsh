alias srcenv="source $HOME/.zshenv"
alias src="source $HOME/.zshrc"

# Different useful ls patterns
# l[a][(size | date)[r]]
#   - a: all files
#   - size: sort by size
#   - date: sort by date
#   - r: reverse sort

# Use eza for ls if available
if command -v eza >/dev/null 2>&1; then
  alias l="eza -lhF --color=always"
  alias la="eza -lhaF --color=always"
  alias lsize="eza -lhFS --color=always --sort=size --reverse"
  alias lasize="eza -lhaFS --color=always --sort=size --reverse"
  alias lsizer="eza -lhFS --color=always --sort=size"
  alias lasizer="eza -lhaFS --color=always --sort=size"
  alias ldate="eza -lhF --color=always --sort=modified"
  alias ladate="eza -lhaF --color=always --sort=modified"
  alias ldater="eza -lhF --color=always --sort=modified --reverse"
  alias ladater="eza -lhaF --color=always --sort=modified --reverse"

# Otherwise use ls
else
  alias l="ls -lhF --color"
  alias la="ls -lhaF --color"
  alias lsize="ls -lhAFSr --color"
  alias lasize="ls -lhAFSr --color"
  alias lsizer="ls -lhAFS --color"
  alias lasizer="ls -lhAFS --color"
  alias ldate="ls -lhAFtr --color"
  alias ladate="ls -lhAFtr --color"
  alias ldater="ls -lhAFt --color"
  alias ladater="ls -lhAFt --color"
fi

# Search for pattern in history
function h() {
  if [ -z "$1" ]; then
    history
  else
    fc -Dlim "*$@*" 1
  fi
}

alias k="kubectl"

alias v="version_all"

alias rl="env_lib_reload"

alias nv="source $HOME/env/.env.ide.local && nvim"
