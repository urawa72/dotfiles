# oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"
# ZSH_THEME="agnoster"
ZSH_THEME="avit"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# alias
alias ls="ls -FG"
alias ll="ls -lAFG"
alias gg="git grep -H --heading --break"
alias gd="git diff"
alias gb="git branch"
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

# PATH
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$PYENV_ROOT/versions/anaconda3-2.5.0/envs/py2/:$PATH"
eval "$(ndenv init -)"
eval "$(rbenv init -)"

# touchでmkdirも
dirtouch() {
  mkdir -p "$(dirname $1)"
  touch "$1"
}
alias touch=dirtouch

# fvimでvim起動
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
  vim $selected_files
}

prompt_context(){}
