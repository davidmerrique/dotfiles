rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

export NVM_DIR=$(cd ~/.nvm && pwd -P)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# function precmd() {
#   export PATH="$(npm bin):$PATH"
# }

source <(npx --shell-auto-fallback zsh)
