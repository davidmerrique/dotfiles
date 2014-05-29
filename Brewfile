# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install findutils
# Install Bash 4
install bash

# install hub
install hub

# Install wget with IRI support
install wget --enable-iri

# Install RingoJS and Narwhal
# Note that the order in which these are installed is important; see http://git.io/brew-narwhal-ringo.
install ringojs
install narwhal

# Install more recent versions of some OS X tools
install vim --override-system-vi
tap homebrew/dupes
install homebrew/dupes/grep
tap josegonzalez/homebrew-php
install php54

# This formula didn’t work well last time I tried it:
#install homebrew/dupes/screen

# Install other useful binaries
install ack
#install exiv2
install git
#install imagemagick
install graphicsmagick --with-libtiff
install lynx
install node
install pigz
install rename
install rhino
install tree
install webkit2png
install zopfli

tap homebrew/versions
install lua52

install z
install go

# cask - https://github.com/caskroom/homebrew-cask
tap caskroom/cask
tap caskroom/fonts
install brew-cask
cask install font-inconsolata
cask install font-open-sans
cask install font-open-sans-condensed
cask install font-source-code-pro
cask install font-source-sans-pro
cask install font-source-serif-pro
cask install font-fira-mono
cask install font-fira-sans
cask install font-fontawesome
cask install font-droid-sans
cask install font-droid-sans-mono
cask install font-droid-serif

# Remove outdated versions from the cellar
cleanup
