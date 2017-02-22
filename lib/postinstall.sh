#!/bin/bash

export DOTFILES=$HOME/.dotfiles
export ZPLUG_HOME=$HOME/.zplug

if [ ! -d $ZPLUG_HOME ]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

if [ ! -d $HOME/.nvm ]; then
  git clone https://github.com/creationix/nvm.git $HOME/.nvm && cd $HOME/.nvm && git checkout `git describe --abbrev=0 --tags`
fi

if [[ "$OSTYPE" == 'mac' ]]; then
  if [ ! -d /usr/local/m-cli ]; then
    curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh
  fi
fi

if [ ! -d $HOME/bin ]; then
  mkdir -p $HOME/bin
fi

if [ ! -f $HOME/bin/composer.phar ]; then
  curl -sS https://getcomposer.org/installer | php -- --install-dir="$HOME/bin"
fi

if ! grep -Fxq "$(command -v zsh)" /etc/shells
then
  command -v zsh | sudo tee -a /etc/shells
  sudo chsh -s "$(command -v zsh)" "${USER}"
fi
