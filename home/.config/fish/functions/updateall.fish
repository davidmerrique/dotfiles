function updateall -d "Update the system"
  echo 'Updating...'

  fish -c 'cd $DOTFILES && ./install.sh'

  echo 'Updating Homebrew'
  brew update
  brew upgrade
  brew cleanup

  echo 'Updating Yarn & NPM packages'
  yarn global upgrade
  $DOTFILES/bin/npm-yarn-global-upgrade

  echo 'Updating App Store apps'
  mas upgrade
  /usr/sbin/softwareupdate -ia

  echo 'Updating Fish shell'
  fisher update
  fish_update_completions
end