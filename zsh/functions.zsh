updateall() {
  update_commands=(
    "(cd $DOTFILES && ./install.sh)"
    "brew update"
    "brew upgrade --all"
    "brew prune"
    "brew cleanup"
    "brew cask cleanup"
    "brew linkapps"
    "composer self-update"
    "$DOTFILES/bin/nvm-update"
    "npm cache clean -g"
    "npm update -g"
    "(cd $DOTFILES && npm install && npm update)"
    "gem update"
    "gem update --system"
    "mas upgrade"
    "zplug clean --force"
    "zplug update"
  )

  printf "\n**** Running: $i *****\n\n"
  for i in "${update_commands[@]}"; do
    printf "\n**** Running: $i *****\n\n"
    eval ${i}
  done
}
