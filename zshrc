source ~/.zsh/antigen/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle sindresorhus/pure

antigen apply

source ~/.dotfiles/zsh/paths.zsh
source ~/.dotfiles/zsh/vendor.zsh
source ~/.dotfiles/zsh/config.zsh
source ~/.dotfiles/zsh/exports.zsh
source ~/.dotfiles/zsh/keybindings.zsh
source ~/.dotfiles/zsh/aliases.zsh

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
