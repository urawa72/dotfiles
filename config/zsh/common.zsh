# basic
setopt auto_cd
setopt correct
setopt share_history
setopt prompt_subst

# Built-in completion and prompt.  No prompt framework or plugin manager is
# required for the interactive shell.
autoload -Uz add-zsh-hook compinit vcs_info
zstyle ':completion:*' menu select
zstyle ':vcs_info:git:*' formats ' %F{magenta}(%b)%f'
compinit

function _update_prompt_vcs() {
  vcs_info
}
add-zsh-hook precmd _update_prompt_vcs

PROMPT='%F{cyan}%n@%m%f:%F{blue}%~%f${vcs_info_msg_0_} %# '
