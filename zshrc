# source ~/.zsh/antigen/antigen.zsh
#
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-history-substring-search
# antigen bundle zsh-users/zsh-completions
# antigen bundle unixorn/autoupdate-antigen.zshplugin
#
# antigen apply

# load zgen
source ~/zgen/zgen.zsh

# check if there's no init script
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-completions
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
