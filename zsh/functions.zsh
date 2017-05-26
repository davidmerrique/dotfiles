updateall () {
  update_commands=(
    "(cd $DOTFILES && ./install.sh)"
    "brew update"
    "brew upgrade"
    "brew prune"
    "brew cleanup"
    "brew cask cleanup"
    "brew linkapps"
    "composer self-update"
    "$DOTFILES/bin/nvm-update"
    "npm update -g"
    "$DOTFILES/bin/yarn-global-upgrade"
    "(cd $DOTFILES && yarn upgrade)"
    "gem update"
    "gem update --system"
    "mas upgrade"
    "(cd $HOME/.zplug && git pull && source $HOME/.zplug/init.zsh)"
    "zplug clean --force"
    "zplug update"
  )

  for i in "${update_commands[@]}"; do
    printf "\n**** Running: $i *****\n\n"
    eval ${i}
  done
}

mkc () {
  case "$1" in
    */..|*/../) cd -- "$1";; # that doesn't make any sense unless the directory already exists
    /*/../*) (cd "${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd -- "$1";;
    /*) mkdir -p "$1" && cd "$1";;
    */../*) (cd "./${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd "./$1";;
    ../*) (cd .. && mkdir -p "${1#.}") && cd "$1";;
    *) mkdir -p "./$1" && cd "./$1";;
  esac
}

# Start an HTTP server from a directory, optionally specifying the port
server () {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}
