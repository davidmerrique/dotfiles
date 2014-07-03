# oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pure"

plugins=(osx composer brew brew-cask git bower laravel laravel4 node npm rbenv z atom)

export DOTFILES=$HOME/.dotfiles

source $ZSH/oh-my-zsh.sh

for topic_folder ($DOTFILES/*) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;

fpath=(/usr/local/share/zsh/site-functions $fpath)

export GOPATH=$HOME/go

export PATH="./bin:$PATH"
export PATH="./vendor/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.composer/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$DOTFILES/bin:$PATH"

PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')

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

# Safeguard rm - https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md#safeguard-rm
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

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
ulimit -S -n 2048

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

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
