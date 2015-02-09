source ~/.zsh/antigen/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions

antigen apply

for topic_folder ($DOTFILES/*) if [ -d $topic_folder ]; then fpath=($topic_folder $fpath); fi;

fpath=( /usr/local/share/zsh-completions $fpath )
fpath=( /usr/local/share/zsh/site-functions $fpath )
fpath=( "$HOME/.zfunctions" $fpath )

# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

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

# phpbrew
source ~/.phpbrew/bashrc

# z
. `brew --prefix`/etc/profile.d/z.sh

# Base16 Shell
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

expand-or-complete-with-dots() {      # This bunch of code displays red dots when autocompleting
  echo -n "\e[31m......\e[0m"         # a command with the tab key, "Oh-my-zsh"-style.
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NODE_PATH=$NODE_PATH:`npm root -g`
export PATH="$(npm bin):$PATH"

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
