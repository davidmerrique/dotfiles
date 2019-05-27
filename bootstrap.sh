#!/bin/bash

export DOTFILES=$HOME/.dotfiles
export ZPLUG_HOME=$HOME/.zplug

pubkey=$HOME/.ssh/id_rsa.pub
echo 'Checking for SSH key, generating one if it does not exist...'
[[ -f $pubkey ]] || ssh-keygen -t rsa

if [[ `uname` == 'Darwin' ]]; then
  which -s brew
  if [[ $? != 0 ]]; then
    echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew update
      brew bundle
  fi

  # echo 'Running macos script'
  # source 'macos'
fi

echo 'Installing dotfiles'
source 'install.sh'

if [ ! -d $ZPLUG_HOME ]; then
  echo 'Installing zplug'
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

if [[ `uname` == 'Darwin' ]]; then
  echo 'Installing m-cli'
  if [ ! -d /usr/local/m-cli ]; then
    curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh
  fi
fi

if [ ! -f /usr/local/bin/composer ]; then
  echo 'Installing composer'
  curl -sS https://getcomposer.org/installer | php -- --install-dir="/usr/local/bin" --filename=composer
fi

if ! grep -Fxq "$(command -v zsh)" /etc/shells
then
  echo 'Switching to zsh'
  command -v zsh | sudo tee -a /etc/shells
  sudo chsh -s "$(command -v zsh)" "${USER}"
fi
