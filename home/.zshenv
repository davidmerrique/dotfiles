export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export DOTFILES=$HOME/.dotfiles

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

export GOPATH=$HOME/go

ZGEN_RESET_ON_CHANGE=(${DOTFILES}/zshrc)

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
