rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NODE_PATH="$(npm root -g):$NODE_PATH"

function precmd() {
  export PATH="$(npm bin):$PATH"
}
