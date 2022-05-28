ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light "sindresorhus/pure"
zinit light "asdf-vm/asdf"
zinit light "zsh-users/zsh-syntax-highlighting"
zinit light "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-completions"
bindkey '^j' autosuggest-accept

fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit
