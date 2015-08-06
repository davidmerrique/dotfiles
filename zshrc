source ~/zgen/zgen.zsh

if ! zgen saved; then
  echo "Creating a zgen save"

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-completions src
  zgen load mafredri/zsh-async
  zgen load rimraf/k
  zgen load sindresorhus/pure

  zgen save
fi

source ~/.dotfiles/zsh/paths.zsh
source ~/.dotfiles/zsh/vendor.zsh
source ~/.dotfiles/zsh/config.zsh
source ~/.dotfiles/zsh/exports.zsh
source ~/.dotfiles/zsh/keybindings.zsh
source ~/.dotfiles/zsh/aliases.zsh

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
