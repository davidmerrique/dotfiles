function updateall -d "Update the system"
  echo 'Updating...'

  fish -c 'cd $DOTFILES && ./install.sh'

  echo 'Updating Homebrew'
  brew update
  brew upgrade
  brew cleanup

  echo 'Updating NPM packages'
  $DOTFILES/bin/npm-global-upgrade

  echo 'Updating Fish shell'
  fisher update
  fish_update_completions

  echo 'Updating App Store apps'
  mas upgrade
  /usr/sbin/softwareupdate -ia
end