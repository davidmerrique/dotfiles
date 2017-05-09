export DOTFILES=$HOME/.dotfiles

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

export GOPATH=$HOME/go

unsetopt BG_NICE

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
