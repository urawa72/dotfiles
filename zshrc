ZSHCONFIG="${HOME}/.config/zsh"

source $ZSHCONFIG/common.zsh
source $ZSHCONFIG/environments.zsh
source $ZSHCONFIG/alias.zsh
source $ZSHCONFIG/functions.zsh
source $ZSHCONFIG/zplug.zsh

prompt pure
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
