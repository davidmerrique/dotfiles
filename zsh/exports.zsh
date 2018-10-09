# enable colored output from ls, etc
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export HISTFILE=~/.zsh_history
export HISTSIZE=SAVEHIST=99999

export DIRSTACKSIZE=5

# Don't clear the screen after quitting a manual page
export MANPAGER="less -X"

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# disable ._ file
export COPYFILE_DISABLE=true

# Disable homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

export EDITOR=vim

export NPM_CONFIG_SAVE=true
export NPM_CONFIG_SAVE_EXACT=true
export NPM_CONFIG_PROGRESS=true