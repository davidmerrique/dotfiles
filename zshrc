export DOTFILES=$HOME/.dotfiles

source ~/.zplug/init.zsh

zplug "zplug/zplug"
zplug "rupa/z", use:z.sh
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "knu/zsh-manydots-magic", use:manydots-magic, nice:11
zplug "robbyrussell/oh-my-zsh", use:plugins/sudo/sudo.plugin.zsh
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))", nice:13
zplug "djui/alias-tips"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "mafredri/zsh-async"
zplug "so-fancy/diff-so-fancy", as:command
zplug "supercrabtree/bam-pow", use:bam.sh
zplug "lukechilds/zsh-better-npm-completion", nice:12
zplug "supercrabtree/k"
zplug "sindresorhus/pure"

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

# Local config
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
