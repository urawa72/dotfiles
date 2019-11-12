# bashrc読み込み
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# rbenv
eval "$(rbenv init -)"

# ndenv
eval "$(ndenv init -)"
export PATH="$HOME/.ndenv/bin:$PATH"

# mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# Go
export PATH=$GOPATH/bin:$PATH

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

