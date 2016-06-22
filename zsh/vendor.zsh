# load rbenv if available
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# phpbrew
# brew link icu4c gettext --force
# phpbrew -d install 5.6.13 +default+dbs+mcrypt+iconv+icu+session+mcrypt+openssl
# phpbrew -d install 5.6.13 +default+dbs+mcrypt+iconv+icu+session+mcrypt+openssl+gd -- --with-gd=shared --enable-gd-natf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local
# phpbrew -d ext install gd -- --with-gd-native--ttf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-zlib-dir=/usr/local --with-freetype-dir=/usr/local
# source ~/.phpbrew/bashrc

# php-version
source $(brew --prefix php-version)/php-version.sh && php-version 5

# z
. `brew --prefix`/etc/profile.d/z.sh

# Base16 Shell
BASE16_SCHEME="tomorrow"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NODE_PATH="$(npm root -g):$NODE_PATH"
export PATH="$(npm bin):$PATH"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# nvm completion
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# npm completion
. <(npm completion)

[[ -f $HOME/torch/install/bin/torch-activate ]] && . $HOME/torch/install/bin/torch-activate
