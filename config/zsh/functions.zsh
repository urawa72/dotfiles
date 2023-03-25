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
  local target_dir=$(ghq list | fzf --reverse --query="$LBUFFER")
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
  BUFFER=$(history -n -r 1 | fzf --reverse --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select_history
bindkey '^r' select_history

# fd-find with fzf
function fd_fzf() {
  local target_dir=$(fd -t d -I -H -E ".git"| fzf --reverse --query="$LBUFFER")
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
  local target_file=$(fd -t f -I -H -E ".git"| fzf --reverse --query="$LBUFFER")
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
bindkey '^P' pet-select

# select my github stars
function select_github_star() {
  if [ -n "$(git config --get user.name)" ]; then
    user_id=$(git config --get user.name)
  else
    echo "Set git config user.name"
    exit 1
  fi
  local chrome="/Applications/Google Chrome.app"
  target=$(curl -s https://api.github.com/users/$user_id/starred\?per_page\=1000 | jq '.[] | .html_url' | awk '{gsub("\"", "");print $0;}' | fzf --reverse --no-sort +m --query "$LBUFFER" --prompt="Stars >")
  open "$target" -a "$chrome"
}
alias stars="select_github_star"

# fadd: git add / diff をインタラクティブに．Ctrl-d で diff, Enter で add
# https://qiita.com/reviry/items/e798da034955c2af84c5
function fadd() {
  local out q n addfiles
  while out=$(
      git status --short |
      awk '{if (substr($0,2,1) !~ / /) print $2}' |
      fzf --multi --exit-0 --expect=ctrl-d); do
    q=$(head -1 <<< "$out")
    n=$[$(wc -l <<< "$out") - 1]
    addfiles=(`echo $(tail "-$n" <<< "$out")`)
    [[ -z "$addfiles" ]] && continue
    if [ "$q" = ctrl-d ]; then
      git diff --color=always $addfiles | less -R
    else
      git add $addfiles
    fi
  done
}

# checkout git branch
function fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fgc (git checkout) - checkout git branch including remote branches
# ref: https://qiita.com/kamykn/items/aa9920f07487559c0c7e
function fgc() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# flog - git commit browser
# ref: https://qiita.com/kamykn/items/aa9920f07487559c0c7e
function flog() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(#C0C0C0)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
              (grep -o '[a-f0-9]\{7\}' | head -1 |
              xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
              {}
              FZF-EOF
             "
}

# fd - cd to selected directory
# https://qiita.com/kamykn/items/aa9920f07487559c0c7e
function fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# change jdk version
function jdk() {
  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
}
