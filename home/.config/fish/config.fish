set DOTFILES $HOME/.dotfiles

alias dotfiles='cd $DOTFILES'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias g="git"
alias h="history"
alias j="jobs"
alias v="vim"
alias o="open"
alias oo="open ."
alias cl="clear"

alias flushdns="dscacheutil -flushcache"

alias osx-hidden-show="defaults write com.apple.finder AppleShowAllFiles -bool true && osx-refresh"
alias osx-hidden-hide="defaults write com.apple.finder AppleShowAllFiles -bool false && osx-refresh"
alias osx-desktop-show="defaults write com.apple.finder CreateDesktop -bool true && osx-refresh"
alias osx-desktop-hide="defaults write com.apple.finder CreateDesktop -bool false && osx-refresh"

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
alias oops='git commit --amend -m'
alias grb='git rebase -p'
alias gup='git remote update -p; git merge --ff-only @{u}'

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias yr='yarn run'
alias nr='npm run'