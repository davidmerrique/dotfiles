rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# function precmd() {
#   export PATH="$(npm bin):$PATH"
# }

source <(npx --shell-auto-fallback zsh)

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export CHEST_DIR="$HOME/Sync/chest"
