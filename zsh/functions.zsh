# for compro
function compile_test() {
  g++ main.cpp
  oj t
}
alias ojt=compile_test
alias ojs="oj s main.cpp"
alias ojtr="cargo compete test"
alias ojts="cargo compete submit"

# for aws
function change_role() {
  if [ $# -eq 0 ]; then
    echo 引数を設定してください
    return
  fi
  echo Change Role
  export AWS_PROFILE=$1
  eval $(command assume-role $1)
}

# ghq
function ghq_fzf() {
  local target_dir=$(ghq list | fzf-tmux --reverse --query="$LBUFFER")
  local ghq_root=$(ghq root)
  if [ -n "$target_dir" ]; then
    BUFFER="cd ${ghq_root}/${target_dir}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N ghq_fzf
bindkey "^g" ghq_fzf

# select history
function select_history() {
  BUFFER=$(history -n -r 1 | fzf-tmux --reverse --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select_history
bindkey '^r' select_history

# fd-find with fzf
function fd_fzf() {
  local target_dir=$(fd -t d -I -H -E ".git"| fzf-tmux --reverse --query="$LBUFFER")
  local current_dir=$(pwd)
  if [ -n "$target_dir" ]; then
    BUFFER="cd ${current_dir}/${target_dir}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fd_fzf
bindkey "^n" fd_fzf

# fd-find with fzf and vim
function fd_fzf_vim() {
  local target_file=$(fd -t f -I -H -E ".git"| fzf-tmux --reverse --query="$LBUFFER")
  local current_dir=$(pwd)
  if [ -n "$target_file" ]; then
    nvim "${current_dir}/${target_file}"
  fi
}
alias fv="fd_fzf_vim"

# snippet
function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^p' pet-select

# select my github stars
function select_github_star() {
  if [ -n "$(git config --get user.name)" ]; then
    user_id=$(git config --get user.name)
  else
    echo "Set git config user.name"
    exit 1
  fi
  local chrome="/Applications/Google Chrome.app"
  target=$(curl -s https://api.github.com/users/$user_id/starred\?per_page\=1000 | jq '.[] | .html_url' | awk '{gsub("\"", "");print $0;}' | fzf-tmux --reverse --no-sort +m --query "$LBUFFER" --prompt="Stars >")
  open "$target" -a "$chrome"
}
alias stars="select_github_star"

# git add fzf
function gadd() {
    local selected
    selected=$(unbuffer git status -s | fzf -m --ansi --preview="echo {} | awk '{print \$2}' | xargs git diff --color" | awk '{print $2}')
    if [[ -n "$selected" ]]; then
        selected=$(tr '\n' ' ' <<< "$selected")
        git add $selected
    fi
}

# change jdk version
function jdk() {
  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
}
