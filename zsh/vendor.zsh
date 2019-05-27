rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

source <(npx --shell-auto-fallback zsh)

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export CHEST_DIR="$HOME/Sync/chest"
