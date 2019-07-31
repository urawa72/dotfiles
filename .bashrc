# ターミナルの表示設定（git含む）
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[35m\]:\[\033[35m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

# brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# direnv
eval "$(direnv hook bash)"

# alias
alias ll="ls -la"
alias gd="git diff"
alias gf="git fetch"
alias gb="git branch"
alias gs="git status"
alias d="docker"
alias dc="docker-compose"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

