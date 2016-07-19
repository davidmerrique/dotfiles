export DOTFILES=$HOME/.dotfiles

source $HOME/zgen/zgen.zsh

if ! zgen saved; then
  echo "Creating a zgen save"

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-completions src
  zgen load mafredri/zsh-async
  zgen load lukechilds/zsh-nvm
  zgen load rimraf/k
  zgen load sindresorhus/pure

  zgen save
fi

source $DOTFILES/zsh/paths.zsh
source $DOTFILES/zsh/vendor.zsh
source $DOTFILES/zsh/config.zsh
source $DOTFILES/zsh/exports.zsh
source $DOTFILES/zsh/keybindings.zsh
source $DOTFILES/zsh/aliases.zsh
for function in $DOTFILES/zsh/functions/*; do
  source $function
done

# Local config
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
