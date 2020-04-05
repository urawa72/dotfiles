# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz vcs_info
# black red green yellow blue magenta cyan white
autoload -Uz colors
colors
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'
# formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' check-for-changes true
# commit されていないファイルがある
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"
# add されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+"
# 通常
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f"
# rebase 途中,merge コンフリクト等 formats 外の表示
zstyle ':vcs_info:*' actionformats '[%b|%a]'


# プロンプト表示直前に vcs_info 呼び出し
precmd () { vcs_info }
# プロンプト（左）
PROMPT=$'%{\e[$[32+$RANDOM % 5]m%}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}'
PROMPT=$PROMPT'${vcs_info_msg_0_} %{${fg[red]}%}%}$%{${reset_color}%} '
# プロンプト（右）
RPROMPT='%{${fg[red]}%}[%~]%{${reset_color}%}'


# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history


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
alias dia="docker images"
alias dih="docker images | head -n 10"
alias dc="docker-compose"
alias bs="brew services"
alias agg="ag -g"
alias tt="tmux"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# rails関連alias
alias rake="bin/rake"
alias rails="bin/rails"
alias for="bin/foreman s"


# PATH
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$PYENV_ROOT/versions/anaconda3-2.5.0/envs/py2/:$PATH"
eval "$(ndenv init -)"


# fvimでvim起動
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
  vim $selected_files
}

# touchでmkdirも
dirtouch() {
    mkdir -p "$(dirname $1)"
    touch "$1"
}
alias touch=dirtouch
