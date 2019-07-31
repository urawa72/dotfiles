# bashrc読み込み
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

#ruby
eval "$(rbenv init -)"

#yarn
export PATH="$HOME/.yarn/bin:$PATH"

# mysql5.7
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
export GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
