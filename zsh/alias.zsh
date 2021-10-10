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

# colordiff
if [[ $(command -v colordiff) ]]; then
  alias diff='colordiff'
fi

# npm
alias envinfo='npx envinfo'
alias uuid='npx uuid'

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
