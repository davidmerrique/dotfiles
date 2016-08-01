export DOTFILES=$HOME/.dotfiles

source ~/.zplug/init.zsh

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "djui/alias-tips"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "supercrabtree/k"
zplug "rupa/z", use:z.sh
zplug "mathiasbynens/dotfiles", as:command, use:".macos", rename-to:"macos"
zplug "Jxck/dotfiles", as:command, use:bin/l
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "lukechilds/zsh-better-npm-completion", nice:12

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load

source $DOTFILES/zsh/paths.zsh
source $DOTFILES/zsh/vendor.zsh
source $DOTFILES/zsh/config.zsh
source $DOTFILES/zsh/exports.zsh
source $DOTFILES/zsh/keybindings.zsh
source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/functions.zsh

# Local config
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
