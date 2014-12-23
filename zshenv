NPM_PACKAGES="$HOME/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export DOTFILES=$HOME/.dotfiles

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

export GOPATH=$HOME/go

path=(
  ./bin
  $DOTFILES/bin
  $NPM_PACKAGES/bin
  $HOME/.chefdk/gem/ruby/2.1.0/bin
  /opt/chefdk/bin
  $HOME/.rbenv/shims
  $HOME/.rbenv/bin
  $HOME/.bin
  $HOME/bin
  $HOME/.composer/bin
  $GOPATH/bin
  ./vendor/bin
  /usr/local/bin
  /usr/local/sbin
  /usr/local/share/npm/bin
  /usr/local/mysql/bin
  /usr/local/opt/coreutils/libexec/gnubin
  $path
)

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
