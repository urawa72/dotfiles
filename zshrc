ZSHCONFIG="${HOME}/.config/zsh"

source $ZSHCONFIG/environments.zsh
source $ZSHCONFIG/common.zsh
source $ZSHCONFIG/alias.zsh
source $ZSHCONFIG/functions.zsh
source $ZSHCONFIG/zplug.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
