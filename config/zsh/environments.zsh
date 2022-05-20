# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
if [[ $(command -v anyenv) ]]; then
  eval "$(anyenv init -)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  eval "$(rbenv init -)"
  eval "$(goenv init -)"
fi

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
  export EDITOR=vim
  eval "$(direnv hook zsh)"
fi

if [ "$(uname)" = 'Darwin' ]; then
  export PATH="$PATH:/opt/homebrew/bin"
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
  export PATT=$PATH:$JAVA_HOME/bin
else
  echo "Unknown OS"
fi
