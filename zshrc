NPM_PACKAGES="$HOME/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

plugins=(osx composer brew brew-cask bower laravel4 node npm rbenv z atom)

export DOTFILES=$HOME/.dotfiles

for topic_folder ($DOTFILES/*) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;

fpath=( /usr/local/share/zsh/site-functions $fpath )
fpath=( "$HOME/.zfunctions" $fpath )

export GOPATH=$HOME/go

path=(
  ./bin
  $NPM_PACKAGES/bin
  $HOME/.rbenv/shims
  $HOME/.rbenv/bin
  $HOME/.bin
  $HOME/bin
  $HOME/.composer/bin
  $GOPATH/bin
  $DOTFILES/bin
  ./vendor/bin
  /usr/local/bin
  /usr/local/sbin
  /usr/local/share/npm/bin
  /usr/local/mysql/bin
  /usr/local/opt/coreutils/libexec/gnubin
  $path
)

# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

autoload -U $DOTFILES/zsh/functions/*(:t)

autoload -U promptinit && promptinit
prompt pure

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

# php-version
source $(brew --prefix php-version)/php-version.sh && php-version 5

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - zsh --no-rehash)"
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
