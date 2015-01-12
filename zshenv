NPM_PACKAGES="$HOME/.npm-packages"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export DOTFILES=$HOME/.dotfiles

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

export GOPATH=$HOME/go

path+=./bin
path+=$DOTFILES/bin
path+=$NPM_PACKAGES/bin
path+=/opt/chefdk/bin
path+=$HOME/.rbenv/shims
path+=$HOME/.rbenv/bin
path+=$HOME/.bin
path+=$HOME/bin
path+=$HOME/.composer/bin
path+=$HOME/.composer/vendor/bin
path+=$GOPATH/bin
path+=./vendor/bin
path+=/usr/local/bin
path+=/usr/local/sbin
path+=/usr/local/share/npm/bin
path+=/usr/local/mysql/bin
path+=/usr/local/opt/coreutils/libexec/gnubin
path+=/usr/bin
path+=/usr/sbin
path+=/sbin

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
