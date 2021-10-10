# java
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
export PATT=$PATH:$JAVA_HOME/bin

# clipboard
alias xc="xclip -selection c"

# ls alias
alias ls='ls -F --color'

# docker
alias d="sudo docker"
alias dc="sudo docker-compose"
