eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NODE_PATH="$(npm root -g):$NODE_PATH"

function precmd() {
  export PATH="$(npm bin):$PATH"
}

# nvm completion
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# npm completion
. <(npm completion)

# Swift
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi