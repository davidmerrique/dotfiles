export DOTFILES=$HOME/.dotfiles

if [[ -f $HOME/.zplug/init.zsh ]]; then
  source $HOME/.zplug/init.zsh

  zplug "plugins/yarn", from:oh-my-zsh
  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-history-substring-search"
  zplug "zsh-users/zsh-syntax-highlighting", defer:3
  zplug "rupa/z", use:z.sh
  zplug "supercrabtree/k", use:k.sh
  zplug "lukechilds/zsh-better-npm-completion"
  zplug "lukechilds/zsh-nvm"
  zplug "mafredri/zsh-async", on:sindresorhus/pure
  zplug "sindresorhus/pure", as:theme, use:pure.zsh

  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  zplug load
fi

source $DOTFILES/zsh/paths.zsh
source $DOTFILES/zsh/vendor.zsh
source $DOTFILES/zsh/config.zsh
source $DOTFILES/zsh/exports.zsh
source $DOTFILES/zsh/keybindings.zsh
source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/functions.zsh

# Local config
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
