# prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit

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

# environments
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color
case "${OSTYPE}" in
darwin*)
	# c/c++ clang
  export PATH="/usr/local/opt/llvm/bin:$PATH"
  export CC="clang"
  export CXX="clang++"
  ;;
linux*)
	# java
  export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
  export PATT=$PATH:$JAVA_HOME/bin
  ;;
esac

# zplug
export ZDOTDIR=$HOME
export ZPLUG_HOME=$ZDOTDIR/.zplug
export ZPLUG_BIN=$ZPLUG_HOME/bin
export ZPLUG_LOADFILE=$ZPLUG_HOME/packages.zsh
export ZPLUG_CACHE_DIR=$ZPLUG_HOME/.cache

# languages
## anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
if [[ $(command -v anyenv) ]]; then
  eval "$(anyenv init -)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  eval "$(rbenv init -)"
fi
## Node.js
export NODE_OPTIONS="--max-old-space-size=4000"
## Deno
export DENO_INSTALL=$HOME/.deno
export PATH=$PATH:$DENO_INSTALL/bin
## Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
## Rust
export PATH=$PATH:$HOME/.cargo/bin

# other
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/sbin

# zplug initialize
if [[ -f $ZPLUG_HOME/init.zsh ]]; then
  source ~/.zplug/init.zsh
fi
# zplug load plugins
if type "zplug" > /dev/null 2>&1; then
  zplug "zsh-users/zsh-syntax-highlighting"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-completions"
  bindkey '^j' autosuggest-accept
  zplug load
fi

# direnv
if [[ $(command -v direnv) ]]; then
  export EDITOR=vim
  eval "$(direnv hook zsh)"
fi


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
alias cat="bat"
# git
alias ga="git add ."
alias gd="git diff"
alias gb="git branch"
alias gbd="git branch --merged master | grep -vE '^\*|master$|main$' | xargs -I % git branch -d %"
alias gs="git status"
alias gl="git log"
alias glg="git log --oneline --graph --decorate"
alias gps="git push"
alias gpl="git pull"
alias gcm="git commit -m"
alias gco="git checkout"
alias gst="git stash"
# other
alias v="nvim"
if [[ $(command -v colordiff) ]]; then
  alias diff='colordiff'
fi
alias xc="xclip -selection c"
# npm
alias envinfo='npx envinfo'
alias uuid='npx uuid'
# python
alias sva='source .venv/bin/activate'
# exa
if [[ $(command -v exa) ]]; then
  alias e='exa --icons'
  # alias l=e
  alias ls=e
  alias ea='exa -a --icons'
  alias la=ea
  alias ee='exa -aal --icons'
  alias ll=ee
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
fi
# docker
case "${OSTYPE}" in
darwin*)
	alias d="docker"
	alias dc="docker compose"
  ;;
linux*)
	alias d="sudo docker"
	alias dc="sudo docker-compose"
  ;;
esac

# for compro
function compile_test() {
  g++ main.cpp
  oj t
}
alias ojt=compile_test
alias ojs="oj s main.cpp"
alias ojtr="cargo atcoder test"
alias ojsr="cargo atcoder submit"

# for aws
function change_role() {
  if [ $# -eq 0 ]; then
    echo 'set argument'
    return
  fi
  echo Change Role
  eval $(command assume-role $1)
  export AWS_DEFAULT_REGION=ap-northeast-1
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

# search with Chrome
function search_google(){
  local url="https://www.google.co.jp/search?q=${*// /+}"
  local app="/Applications"
  local g="${app}/Google Chrome.app"
  open "${url}" -a "$g";
}
alias goo="search_google"

# git add fzf
function gadd() {
  local selected
  selected=$(unbuffer git status -s | fzf -m --ansi --preview="echo {} | awk '{print \$2}' | xargs git diff --color" | awk '{print $2}')
  if [[ -n "$selected" ]]; then
      selected=$(tr '\n' ' ' <<< "$selected")
      git add $selected
  fi
}

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^p' pet-select

prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
