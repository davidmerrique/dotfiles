NPM_PACKAGES="$HOME/.npm-packages"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export DOTFILES=$HOME/.dotfiles

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

export GOPATH=$HOME/go

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
