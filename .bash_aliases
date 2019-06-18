#!/bin/bash

os=$(uname)

env_osx() {
  color='-G'
  alias xclip='pbcopy'
}

env_linux() {
  color='--color=auto'
}

case "$os" in
  Darwin) env_osx   ;;
  Linux)  env_linux ;;
esac

alias l='ls -CF ${color}'
alias l.='ls -d .*[^.$] ${color} 2>/dev/null'
alias la='ls -A ${color}'
alias lah='ls -lah ${color}'
alias ls='ls ${color}'
alias ll.='ls -dl .*[^.$] ${color} 2>/dev/null'
alias ll='ls -AlF ${color}'
alias lla='ls -AlFh ${color}'

#alias grep='grep --color=auto 2>/dev/null'
#alias grep='ag $*' 2>/dev/null
alias tree='tree -a -I .git'
alias dtree='tree -ad -I .git'

# open file manager cwd
alias e.='nautilus . 2>/dev/null'

#export TERM=xterm-256colors
#export TERM=screen-256colors
#export TERM=gnome-256colors
#export TERM=mate-terminal

# docker
alias d='docker'
alias dm='docker-machine'
docker_select() {
  eval $(docker-machine env $1)
}
alias dms='docker_select'

# brew
alias bi='brew info'

# cat
alias c='cat'

# overload ag
alias ag='ag --hidden --ignore-dir .git'

# ansible
alias ap='ansible-playbook'
alias ad='ansible-doc'
alias al='ansible-lint'

# gopass
alias p='gopass'

# rsync
alias qcp='rsync -avzh'

# vagrant
alias v='vagrant'

# salt
alias sc='salt-cloud -c ./salt'

# blind
alias viu='vi -u NONE'

# loop
alias lo='_lo '
