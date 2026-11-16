# Keep zinit available for interactive-shell helpers. The prompt itself uses
# zsh built-ins in common.zsh.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ -r "${ZINIT_HOME}/zinit.zsh" ]]; then
  source "${ZINIT_HOME}/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  zinit light "zsh-users/zsh-autosuggestions"
  zinit light "zsh-users/zsh-completions"
  zinit light "zsh-users/zsh-syntax-highlighting"
  bindkey '^j' autosuggest-accept
fi
