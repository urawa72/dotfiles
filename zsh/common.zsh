# prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit

# basic
setopt auto_cd
setopt correct
setopt share_history

# dir color
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

# lang
export LC_CTYPE=en_US.UTF-8

# term color
export TERM=xterm-256color
