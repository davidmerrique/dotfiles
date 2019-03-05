export DOTFILES=$HOME/.dotfiles

if [[ -f $HOME/.zplug/init.zsh ]]; then
  source $HOME/.zplug/init.zsh

  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-history-substring-search"
  zplug "zsh-users/zsh-syntax-highlighting", defer:3
  zplug "rupa/z", use:z.sh
  zplug "supercrabtree/k", use:k.sh
  zplug "lukechilds/zsh-better-npm-completion"
  zplug "buonomo/yarn-completion", defer:3
  zplug "mafredri/zsh-async", from:github
  zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

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

# Local config
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

# fnm
export PATH=$HOME/.fnm:$PATH
eval `fnm env`
