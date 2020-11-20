# zplug
# source ~/.zplug/init.zsh
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
bindkey '^j' autosuggest-accept


# prompt
# eval "$(starship init zsh)"
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
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.local/bin/:$PATH"
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/.cargo
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color


# anyenv
case "${OSTYPE}" in
darwin*)
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  ;;
esac
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export NODE_OPTIONS="--max-old-space-size=4096"
export N_PREFIX="$HOME/.n"
export PATH="$PATH:$N_PREFIX/bin"


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
# git
alias g="git"
alias gd="git diff"
alias gb="git branch"
alias gbd="git branch --merged develop | grep -vE '^\*|master$|develop$|release$' | xargs -I % git branch -d %"
alias gs="git status"
alias gl="git log"
alias gp="git push"
# other
alias tt="tmux"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias ca="cargo"
alias vim="nvim"
alias l="lazygit"
if [[ $(command -v colordiff) ]]; then
  alias diff='colordiff'
fi
# npm
alias infoenv='npx envinfo'
alias jwt='npx jwt'
alias uuid='npx uuid'
# exa
if [[ $(command -v exa) ]]; then
  alias e='exa --icons'
  alias l=e
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
alias d="docker"
alias dc="docker-compose"

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

function _date() {
  date "+%Y%m%d-%H%M%S"
}
alias date="_date"


# vcxsrv for wsl
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
# export DISPLAY=localhost:0.0

prompt pure
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
