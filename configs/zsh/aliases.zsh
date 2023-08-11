alias src="source $HOME/.zshrc"

# Different useful ls patterns
# l[a][(size | date)[r]]
#   - a: all files
#   - size: sort by size
#   - date: sort by date
#   - r: reverse sort
# alias l="command -v exa >/dev/null 2>&1 && exa -lhF --color=always || 'ls' -lhF --color"

function l() {
  if command -v exa >/dev/null 2>&1; then
    exa -lhF --color=always "$@"
  else
    ls -lhF --color "$@"
  fi
}

function la() {
  if command -v exa >/dev/null 2>&1; then
    exa -lhaF --color=always "$@"
  else
    ls -lhAF --color "$@"
  fi
}

function lsize() {
  if command -v exa >/dev/null 2>&1; then
    exa -lhFS --color=always --sort=size --reverse "$@"
  else
    ls -lhAFSr --color "$@"
  fi
}

function lasize() {
  if command -v exa >/dev/null 2>&1; then
    exa -lhaFS --color=always --sort=size --reverse "$@"
  else
    ls -lhAFSr --color "$@"
  fi
}

function lsizer() {
  if command -v exa >/dev/null 2>&1; then
    exa -lhFS --color=always --sort=size "$@"
  else
    ls -lhAFS --color "$@"
  fi
}

function lasizer() {
  if command -v exa >/dev/null 2>&1; then
    exa -lhaFS --color=always --sort=size "$@"
  else
    ls -lhAFS --color "$@"
  fi
}

function ldate() {
  if command -v exa >/dev/null 2>&1; then
    exa -lhF --color=always --sort=modified "$@"
  else
    ls -lhAFtr --color "$@"
  fi
}

function ladate() {
  if command -v exa >/dev/null 2>&1; then
    exa -lhaF --color=always --sort=modified "$@"
  else
    ls -lhAFtr --color "$@"
  fi
}

function ldater() {
  if command -v exa >/dev/null 2>&1; then
    exa -lhF --color=always --sort=modified --reverse "$@"
  else
    ls -lhAFt --color "$@"
  fi
}

function ladater() {
  if command -v exa >/dev/null 2>&1; then
    exa -lhaF --color=always --sort=modified --reverse "$@"
  else
    ls -lhAFt --color "$@"
  fi
}

# Search for pattern in history
function h() {
  if [ -z "$1" ]; then
    history
  else
    fc -Dlim "*$@*" 1
  fi
}