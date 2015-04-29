if [ -x /usr/libexec/path_helper ]; then
  PATH=''
  eval `/usr/libexec/path_helper -s`
fi

path=( "/sbin" $path )
path=( "/usr/sbin" $path )
path=( "/usr/bin" $path )
path=( "/usr/local/bin" $path )
path=( "$(brew --prefix coreutils)/libexec/gnubin" $path )
path=( "/usr/local/sbin" $path )
path=( "$GOPATH/bin" $path )
path=( "$HOME/.composer/vendor/bin" $path )
path=( "$HOME/.composer/bin" $path )
path=( "$HOME/bin" $path )
path=( "$HOME/.bin" $path )
path=( "$HOME/.rbenv/bin" $path )
path=( "$HOME/.rbenv/shims" $path )
path=( "$DOTFILES/bin" $path )
path=( "$NPM_PACKAGES/bin" $path )
path=( "./vendor/bin" $path )
path=( "./node_modules/.bin" $path )
path=( "./bin" $path )

typeset -U PATH

export PATH

fpath=( /usr/local/share/zsh-completions $fpath )
fpath=( /usr/local/share/zsh/site-functions $fpath )
fpath=( "$HOME/.zfunctions" $fpath )
