###############################################################################
# cargo
###############################################################################

. "$HOME/.cargo/env"

###############################################################################
# gcloud
###############################################################################

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sidd/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sidd/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sidd/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sidd/opt/google-cloud-sdk/completion.zsh.inc'; fi

###############################################################################
# nvm/node/npm
###############################################################################

init_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

###############################################################################
# stack
###############################################################################

# alias stack="CXX=/opt/homebrew/opt/llvm@15/bin/clang++; stack"
# alias ghcup="CXX=/opt/homebrew/opt/llvm@15/bin/clang++; ghcup"

stack() {
  (
    export CXX=/opt/homebrew/opt/llvm@15/bin/clang++
    command stack "$@"
  )
}

ghcup() {
  (
    export CXX=/opt/homebrew/opt/llvm@15/bin/clang++
    command ghcup "$@"
  )
}
