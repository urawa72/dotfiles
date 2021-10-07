# prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit

# basic
autoload -U compinit
compinit
setopt auto_cd
setopt correct
setopt share_history

# dir color
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

# environments
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color

# direnv
if [[ $(command -v direnv) ]]; then
  export EDITOR=vim
  eval "$(direnv hook zsh)"
fi
