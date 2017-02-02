# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  source `brew --prefix`/etc/grc.bashrc
fi

# Use coreutils `ls` if possible
if which gls >/dev/null 2>&1; then
  alias gls="ls"
fi

# Always use color output for `ls`
# Detect which `ls` flavor is in use
if which gls --color >/dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

export CLICOLOR_FORCE=1

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# ls options: A = include hidden (but not . or ..), F = put `/` after folders, h = byte unit suffixes
alias ls='ls -AFh ${colorflag} --group-directories-first'

# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"

# List only directories
alias lsd='gls -l | grep "^d"'

alias flushdns="dscacheutil -flushcache"
alias artisan="php artisan"
alias composer="php $HOME/bin/composer.phar"

alias nr="npm run"
alias yr="yarn run"

alias dotfiles="cd $DOTFILES"
alias dotedit="atom $DOTFILES"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias g="git"
alias h="history"
alias j="jobs"
alias v="vim"
alias o="open"
alias oo="open ."
alias cl="clear"

# Enable aliases to be sudo’ed
alias sudo='nocorrect sudo '

# Repair Disk Permissions
alias permissions="diskutil repairPermissions /"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

alias osx-hidden-show="defaults write com.apple.finder AppleShowAllFiles -bool true && osx-refresh"
alias osx-hidden-hide="defaults write com.apple.finder AppleShowAllFiles -bool false && osx-refresh"
alias osx-desktop-show="defaults write com.apple.finder CreateDesktop -bool true && osx-refresh"
alias osx-desktop-hide="defaults write com.apple.finder CreateDesktop -bool false && osx-refresh"

alias reload!='. ~/.zshrc'

# git aliases
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gcam='git commit -am'
alias gpl='git pull'
alias gpu='git push'
alias glog="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gl='git pull --prune'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias oops='git commit --amend -m'
alias grb='git rebase -p'
alias gup='git remote update -p; git merge --ff-only @{u}'

# Pipe my public key to my clipboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias list-aliases="alias | sed 's/=.*//'"
alias list-functions="declare -f | grep '^[a-z].* () {' | sed 's/{$//'" # show non _prefixed functions
alias list="cat <(list-aliases) <(list-functions) | sort"
alias search="list | grep"

## ls: Detect which `ls` flavor is in use
if ls --color &> /dev/null
then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi
alias l="ls -l ${colorflag}" # List all files colorized in long format
alias la="ls -la ${colorflag}" # List all files colorized in long format, including dot files
alias lsd='ls -l ${colorflag} | grep "^d"' # List only directories
alias ls="command ls ${colorflag}" # Always use color output for `ls`
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

## MySQL (from brew)
alias mysqlstart="mysql.server start"
alias mysqlstop="mysql.server stop"
