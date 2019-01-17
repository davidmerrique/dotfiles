function updateall
  fish -c 'cd $DOTFILES && ./install.sh'
  brew update
  brew upgrade
  brew cleanup
  yarn global upgrade
  $DOTFILES/bin/npm-yarn-global-upgrade
  mas upgrade
  fisher
  fisher self-update
end