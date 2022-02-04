# zplug
export ZDOTDIR=$HOME
export ZPLUG_HOME=$ZDOTDIR/.zplug
export ZPLUG_BIN=$ZPLUG_HOME/bin
export ZPLUG_LOADFILE=$ZPLUG_HOME/packages.zsh
export ZPLUG_CACHE_DIR=$ZPLUG_HOME/.cache

# zplug initialize
if [[ -f $ZPLUG_HOME/init.zsh ]]; then
  source ~/.zplug/init.zsh
  zplug "zsh-users/zsh-syntax-highlighting"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-completions"
  bindkey '^j' autosuggest-accept
  zplug load
fi
