if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  pmodload 'history-substring-search' 'syntax-highlighting'
fi

for topic_folder ($DOTFILES/*) if [ -d $topic_folder ]; then fpath=($topic_folder $fpath); fi;

fpath=( /usr/local/share/zsh-completions $fpath )
fpath=( /usr/local/share/zsh/site-functions $fpath )
fpath=( "$HOME/.zfunctions" $fpath )

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

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# history settings
setopt hist_ignore_all_dups inc_append_history
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

# Tab completion from both ends
setopt completeinword

# Tab completion should be case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Better completion for killall.
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

setopt nocasematch

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

# php-version
source $(brew --prefix php-version)/php-version.sh && php-version 5

# z
. `brew --prefix`/etc/profile.d/z.sh

# Base16 Shell
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# # Syntax highlighting
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#
# # Substring history search
# source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh
#
# # bind UP and DOWN arrow keys
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
#
# # bind P and N for EMACS mode
# bindkey -M emacs '^P' history-substring-search-up
# bindkey -M emacs '^N' history-substring-search-down
#
# # bind k and j for VI mode
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
