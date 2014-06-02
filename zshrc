# oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pure"

# shortcut to this dotfiles path is DOTFILES
export DOTFILES=$HOME/.dotfiles

source $ZSH/oh-my-zsh.sh

plugins=(osx composer brew brew-cask git bower laravel laravel4 node npm rbenv z atom)

# if [[ -n $SSH_CONNECTION ]]; then
#   export PS1='%m:%3~$(git_info_for_prompt)%# '
# else
#   export PS1='%3~$(git_info_for_prompt)%# '
# fi

for topic_folder ($DOTFILES/*) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;

fpath=(/usr/local/share/zsh/site-functions $fpath)

export GOPATH=$HOME/go

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$HOME/.bin:$HOME/bin:./bin:/usr/local/bin:/usr/local/sbin:$HOME/.sfs:$DOTFILES/bin:$DOTFILES/py:/usr/local/share/npm/bin:$PATH:/usr/local/mysql/bin:$PATH:$HOME/.composer/bin:$PATH:$GOPATH/bin:./vendor/bin"

eval "$(rbenv init -)"

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

autoload -U $DOTFILES/zsh/functions/*(:t)

# history settings
setopt histignoredups
HISTFILE=~/.zsh_history
SAVEHIST=4096
HISTSIZE=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Try to correct command line spelling
setopt correct correctall

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# Increases the open file descriptor limit, helps avoid errors when
# running watch processes on a large number of files
ulimit -n 1024

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# expand functions in the prompt
# setopt promptsubst

# z
. `brew --prefix`/etc/profile.d/z.sh

autoload -U colors
colors

# enable colored output from ls, etc
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Base16 Shell
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
