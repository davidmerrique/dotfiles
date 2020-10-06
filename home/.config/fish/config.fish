set DOTFILES $HOME/.dotfiles

alias dotfiles='cd $DOTFILES'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias flushdns="dscacheutil -flushcache"

alias osx-hidden-show="defaults write com.apple.finder AppleShowAllFiles -bool true && osx-refresh"
alias osx-hidden-hide="defaults write com.apple.finder AppleShowAllFiles -bool false && osx-refresh"
alias osx-desktop-show="defaults write com.apple.finder CreateDesktop -bool true && osx-refresh"
alias osx-desktop-hide="defaults write com.apple.finder CreateDesktop -bool false && osx-refresh"

if status --is-interactive
  abbr -a -g g "git"
  abbr -a -g h "history"
  abbr -a -g v "vim"
  abbr -a -g o "open"
  abbr -a -g oo "open ."
  abbr -a -g gs 'git status -sb'
  abbr -a -g gcam 'git commit -am'
  abbr -a -g gpu 'git push'
  abbr -a -g gco 'git checkout'
  abbr -a -g gco 'git checkout'
  abbr -a -g oops 'git commit --amend -m'
  abbr -a -g gup 'git fetch origin && git pull && git submodule update --init --recursive'
  abbr -a -g rm 'trash'
  abbr -a -g yr 'yarn run'
  abbr -a -g nr 'npm run'
end

alias glog="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

set SPACEFISH_PACKAGE_SHOW false
set SPACEFISH_NODE_SHOW false
set SPACEFISH_TIME_SHOW true
set SPACEFISH_TIME_12HR true

# fnm
fnm env --multi | source

set -g fish_user_paths "./node_modules/.bin" $fish_user_paths
