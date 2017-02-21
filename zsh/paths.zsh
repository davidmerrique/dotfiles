export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.composer/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$DOTFILES/bin:$PATH"
export PATH="`yarn global bin`:$PATH"
export PATH="$(npm bin):$PATH"
export PATH="./vendor/bin:$PATH"
export PATH="./bin:$PATH"


[[ "$OSTYPE" == 'mac' ]] && fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
