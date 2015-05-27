# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias l="gls -lAh --color"
  alias ll="gls -laF --color --group-directories-first"
  alias la='gls -A --color'
  alias ls="gls -F --color"
fi

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

function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

alias flushdns="dscacheutil -flushcache"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias artisan="php artisan"
alias composer="php $HOME/bin/composer.phar"

if [ -f $NPM_PACKAGES/bin/npm ]; then
  alias npm=$NPM_PACKAGES/bin/npm
fi

alias npr="npm run"

alias dotfiles="cd $DOTFILES"
alias dotedit="atom $DOTFILES"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
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

# Gzip-enabled `curl`
alias gurl="curl --compressed"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
# alias update='brew update; brew upgrade; npm cache clean -g; npm update -g; sudo -v; gem update; gem update --system; brew prune; brew cleanup; brew linkapps'

# Launch iOS Simulator
alias ios="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"

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

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

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

alias gpthis='git push origin HEAD:$(git_current_branch)'
alias grb='git rebase -p'
# alias gup='git fetch origin && grb origin/$(git_current_branch)'
alias gup='git remote update -p; git merge --ff-only @{u}'

function gb() { git checkout -b "$@" ;}
function mkc() { mkdir -p "$@" && cd "$@" ;}
function shot() { webkit2png -D ~/Sync/images/Screenshots -W 1600 -H 900 -F -d --delay=10 "$@" ;}

# Remove the hosts that I don't want to keep around- in this case, only
# keep the first host. Like a boss.
alias hosts="head -2 ~/.ssh/known_hosts | tail -1 > ~/.ssh/known_hosts"

# Pipe my public key to my clipboard. Fuck you, pay me.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

function updateall() {
  source ~/.zsh/antigen/antigen.zsh
  source ~/.dotfiles/zsh/aliases.zsh

  sudo -v

  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  update_commands=(
    "rcup -d $DOTFILES"
    "brew update"
    "brew upgrade --all"
    "brew prune"
    "brew cleanup"
    "brew linkapps"
    "composer self-update"
    # "phpbrew self-update"
    "phpbrew known --update"
    "$DOTFILES/bin/nvmup"
    "npm cache clean -g"
    "$DOTFILES/npm-upgrade.sh"
    "gem update"
    "gem update --system"
    "zgen selfupdate"
    "zgen update"
  )

  printf "\n**** Running: $i *****\n\n"
  for i in "${update_commands[@]}"; do
    printf "\n**** Running: $i *****\n\n"
    eval ${i}
  done

}

function mov-to-gif() {
  # -r 10 tells ffmpeg to reduce the frame rate from 25 fps to 10
  # -s 600x400 tells ffmpeg the max-width and max-height
  # --delay=3 tells gifsicle to delay 30ms between each gif
  # --optimize=3 requests that gifsicle use the slowest/most file-size optimization
  # ffmpeg -i in.mov -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > out.gif
  ffmpeg -i $1 -vf "scale=800:-1:flags=lanczos" -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=9 #
}
