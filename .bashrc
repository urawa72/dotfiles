# ターミナルの表示設定（git含む）
# source /usr/local/etc/bash_completion.d/git-prompt.sh
# source /usr/local/etc/bash_completion.d/git-completion.bash
# GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\[\033[32m\]\u@\h\[\033[35m\]:\[\033[35m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
export PS1='\[\033[32m\]\u@\h\[\033[35m\]:\[\033[35m\]\W\[\033[31m\]\[\033[00m\]\n\$ '

# brew cask
# export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# alias
alias ll="ls -la"
alias gg="git grep -H --heading --break"
alias gd="git diff"
alias gf="git fetch"
alias gb="git branch"
alias gs="git status"
alias gl="git log"
alias d="docker"
alias dc="docker-compose"
alias rake="bin/rake"
alias rails="bin/rails"
alias for="bin/foreman s"
alias bs="brew services"

