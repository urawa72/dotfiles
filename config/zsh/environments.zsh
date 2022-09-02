# dir color
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

# lang
export LC_CTYPE=en_US.UTF-8

# Node.js
export NODE_OPTIONS="--max-old-space-size=4000"

# Deno
export DENO_INSTALL=$HOME/.deno
export PATH=$PATH:$DENO_INSTALL/bin

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# other
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/sbin

# direnv
if [[ $(command -v direnv) ]]; then
  export EDITOR=nvim
  eval "$(direnv hook zsh)"
fi

# ghcup
# source $HOME/.ghcup/env

# for mac
export PATH="$PATH:/opt/homebrew/bin"

# if [ "$(uname)" = 'Darwin' ]; then
#   export PATH="$PATH:/opt/homebrew/bin"
# elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
#   export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
#   export PATT=$PATH:$JAVA_HOME/bin
# else
#   echo "Unknown OS"
# fi
