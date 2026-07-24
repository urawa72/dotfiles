# Keep zinit available for plugins that need it, but do not load a prompt or
# interactive-shell plugin here.  The prompt and completion configuration uses
# zsh built-ins in common.zsh.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ -r "${ZINIT_HOME}/zinit.zsh" ]]; then
  source "${ZINIT_HOME}/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit
fi
