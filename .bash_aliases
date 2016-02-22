#!/bin/bash

os=$(uname)

case "$os" in
  Darwin) color='-G' ;;
  Linux)  color='--color=auto' ;;
esac

alias l='ls -CF ${color}'
alias l.='ls -d .*[^.$] ${color} 2>/dev/null'
alias la='ls -A ${color}'
alias ls='ls ${color}'
alias ll.='ls -dl .*[^.$] ${color} 2>/dev/null'
alias ll='ls -AlF ${color}'

#alias grep='grep --color=auto 2>/dev/null'
#alias grep='ag $*' 2>/dev/null
alias tree='tree -a -I .git $* 2>/dev/null'
alias dtree='tree -ad -I .git $* 2>/dev/null'

# open file manager cwd
alias e.='nautilus . 2>/dev/null'

#export TERM=xterm-256colors
#export TERM=screen-256colors
#export TERM=gnome-256colors
#export TERM=mate-terminal

