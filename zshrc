ZSHHOME="${HOME}/.config/zsh"

source $ZSHHOME/common.zsh
source $ZSHHOME/environments.zsh
source $ZSHHOME/alias.zsh
source $ZSHHOME/functions.zsh
source $ZSHHOME/zinit.zsh

prompt pure
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
