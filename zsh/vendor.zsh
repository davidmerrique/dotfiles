# load rbenv if available
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# phpbrew
# +default+dbs+mcrypt+iconv+icu+session+mcrypt+openssl
source ~/.phpbrew/bashrc

# z
. `brew --prefix`/etc/profile.d/z.sh

# Base16 Shell
BASE16_SCHEME="tomorrow"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NODE_PATH=$NODE_PATH:`npm root -g`
export PATH="$(npm bin):$PATH"

# nvm completion
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# npm completion
. <(npm completion)
