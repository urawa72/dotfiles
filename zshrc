# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="agnoster"
ZSH_THEME="avit"
plugins=(git)

# alias
alias ls="ls -FG"
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

# rails関連alias
alias rake="bin/rake"
alias rails="bin/rails"
alias fff="bin/foreman s"

# compro
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


# fvimでvim起動
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
  vim $selected_files
}
alias vim="fvim"


source $ZSH/oh-my-zsh.sh
prompt_context(){}
