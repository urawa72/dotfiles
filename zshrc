# prompt
eval "$(starship init zsh)"


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

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
# node
export NODE_OPTIONS="--max-old-space-size=4096"
# rbemv
export PATH=${HOME}/.rbenv/bin:${PATH}
eval "$(rbenv init -)"

# alias
case "${OSTYPE}" in
darwin*)
   alias ls="ls -GF"
   ;;
linux*)
  alias ls='ls -F --color'
    ;;
esac
alias ll="ls -lAFG"
alias gg="git grep -H --heading --break"
alias gd="git diff"
alias gb="git branch"
alias gbd="git branch --merged master | grep -vE '^\*|master$|develop$|deliver$' | xargs -I % git branch -d %"
alias gs="git status"
alias gl="git log"
alias gp="git push"
alias d="docker"
alias dc="docker-compose"
alias bs="brew services"
alias agg="ag -g"
alias tt="tmux"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli -e'
alias ca='cargo'


# for compro
compro_create() {
  mkdir -p "$1/a" "$1/b" "$1/c"
  touch "$1/a/main.cpp"
  touch "$1/b/main.cpp"
  touch "$1/c/main.cpp"
}
compile_test() {
  g++ main.cpp
  oj t
}
alias cc=compro_create
alias ojt=compile_test
alias ojs="oj s main.cpp"
alias ojtp="oj t -c 'python3 main.py'"
alias ojsp="oj s main.py"
alias ojspy="oj s main.py -l 4047"


# PATH
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.local/bin/:$PATH"
export PATH=$PATH:$HOME/Library/Python/3.8/bin
export PATH=$PATH:~/.nodebrew/current/bin/


# fvim for vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
  vim $selected_files
}


# vcxsrv for wsl
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
# export DISPLAY=localhost:0.0
