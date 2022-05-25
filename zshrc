ZSHCONFIG="${HOME}/.config/zsh"

source $ZSHCONFIG/environments.zsh
source $ZSHCONFIG/common.zsh
source $ZSHCONFIG/alias.zsh
source $ZSHCONFIG/functions.zsh
# source $ZSHCONFIG/zplug.zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light "zsh-users/zsh-syntax-highlighting"
zinit light "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-completions"
bindkey '^j' autosuggest-accept

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
