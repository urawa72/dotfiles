# basic
setopt auto_cd
setopt correct
setopt share_history
setopt prompt_subst

# Built-in completion
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

