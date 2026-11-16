# Pure-style minimal prompt for Zsh
# Asynchronously retrieves Git branch, action, dirty state, and ahead/behind counts.

typeset -g _prompt_git_fd=''
typeset -g _prompt_git_info=''

function _prompt_git_stop() {
  if [[ -n "$_prompt_git_fd" ]]; then
    zle -F "$_prompt_git_fd" 2>/dev/null
    exec {_prompt_git_fd}<&-
    _prompt_git_fd=''
  fi
}

function _prompt_git_ready() {
  local fd="$1" info

  if IFS= read -r -u "$fd" info; then
    _prompt_git_info="$info"
  else
    _prompt_git_info=''
  fi

  zle -F "$fd"
  exec {fd}<&-
  _prompt_git_fd=''
  [[ -n "$WIDGET" ]] && zle reset-prompt
}

function _prompt_git_start() {
  _prompt_git_stop
  _prompt_git_info=''
  exec {_prompt_git_fd}< <(
    local git_dir branch dirty="" ahead_behind="" action=""
    git_dir=$(command git rev-parse --git-dir 2>/dev/null) || return 0

    branch=$(command git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -z "$branch" ]]; then
      branch=$(command git rev-parse --short HEAD 2>/dev/null) || return 0
    fi

    # Action state (rebase / merge / cherry-pick)
    if [[ -d "$git_dir/rebase-merge" || -d "$git_dir/rebase-apply" ]]; then
      action="|rebase"
    elif [[ -f "$git_dir/MERGE_HEAD" ]]; then
      action="|merge"
    elif [[ -f "$git_dir/CHERRY_PICK_HEAD" ]]; then
      action="|cherry-pick"
    fi

    # Dirty state (* if unstaged / staged / untracked changes)
    if [[ -n $(command git status --porcelain 2>/dev/null | head -n 1) ]]; then
      dirty="*"
    fi

    # Ahead / Behind upstream
    local counts
    counts=$(command git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
    if [[ -n "$counts" ]]; then
      local ahead="${counts%%	*}"
      local behind="${counts##*	}"
      local ab=""
      (( ahead > 0 )) && ab+="⇡${ahead}"
      (( behind > 0 )) && ab+="⇣${behind}"
      [[ -n "$ab" ]] && ahead_behind=" ${ab}"
    fi

    echo " %F{242}${branch}${action}%f%F{yellow}${dirty}%f%F{cyan}${ahead_behind}%f"
  )
  zle -F "$_prompt_git_fd" _prompt_git_ready
}

zle -N zle-line-init _prompt_git_start
zle -N zle-line-finish _prompt_git_stop

# Pure-style minimal prompt (2 lines: path + git info, magenta/red ❯ symbol)
PROMPT=$'\n%F{blue}%~%f${_prompt_git_info}\n%(?.%F{magenta}.%F{red})❯%f '
