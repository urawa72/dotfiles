# basic
setopt auto_cd
setopt correct
setopt share_history
setopt prompt_subst

# Built-in completion and prompt.  The Git branch is refreshed asynchronously
# so a slow repository never delays the next prompt.
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

typeset -g _prompt_git_fd=''
typeset -g _prompt_git_branch=''

function _prompt_git_stop() {
  if [[ -n "$_prompt_git_fd" ]]; then
    zle -F "$_prompt_git_fd" 2>/dev/null
    exec {_prompt_git_fd}<&-
    _prompt_git_fd=''
  fi
}

function _prompt_git_ready() {
  local fd="$1" branch

  if IFS= read -r -u "$fd" branch; then
    _prompt_git_branch=" %F{magenta}(${branch})%f"
  fi

  zle -F "$fd"
  exec {fd}<&-
  _prompt_git_fd=''
  zle reset-prompt
}

function _prompt_git_start() {
  _prompt_git_stop
  _prompt_git_branch=''
  exec {_prompt_git_fd}< <(command git branch --show-current 2>/dev/null)
  zle -F "$_prompt_git_fd" _prompt_git_ready
}

zle -N zle-line-init _prompt_git_start
zle -N zle-line-finish _prompt_git_stop

PROMPT='%F{cyan}%n@%m%f:%F{blue}%~%f${_prompt_git_branch} %# '
