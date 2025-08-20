# git
alias ga="git add"
alias gd="git diff"
alias gb="git branch"
alias gs="git status"
alias gl="git log"
alias grs="git reset --soft"
alias gbd="git branch --merged main | grep -vE '^\*|main$' | xargs -I % git branch -d %"
alias glg="git log --oneline --graph --decorate"
alias gps="git push"
alias gpl="git pull"
alias gcm="git commit -m"
alias gco="git checkout"
alias gst="git stash"

# neovim
alias v="nvim"

# intellij
alias idea="open -na 'IntelliJ IDEA CE.app'"

# colordiff
if [[ $(command -v colordiff) ]]; then
  alias diff='colordiff'
fi

# npm
alias envinfo='npx envinfo'
alias uuid='npx uuid'

# bat
if [[ $(command -v bat) ]]; then
  alias cat='bat --color=always'
fi

# exa
if [[ $(command -v eza) ]]; then
  alias e='eza --icons'
  # alias l=e
  alias ls=e
  alias ea='eza -a --icons'
  alias la=ea
  alias ee='eza -aal --icons'
  alias ll=ee
  alias et='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='eza -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
fi

alias d="docker"
alias dc="docker compose"

# if [ "$(uname)" = 'Darwin' ]; then
#   alias d="docker"
#   alias dc="docker compose"
# elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
#   alias xc="xclip -selection c"
#   alias ls='ls -F --color'
#   alias d="sudo docker"
#   alias dc="sudo docker-compose"
# else
#   echo "Unknown OS"
# fi
