#!/bin/bash
alias l='ls -CF --color=auto'
alias l.='ls -d .*[^.$] --color=auto 2>/dev/null'
alias la='ls -A --color=auto'
alias ls='ls --color=auto'
alias ll.='ls -dl .*[^.$] --color=auto 2>/dev/null'
alias ll='ls -AlF --color=auto'

#alias grep='grep --color=auto 2>/dev/null'
alias grep='ag $*' 2>/dev/null
alias tree='tree -a -I .git $* 2>/dev/null'
alias dtree='tree -ad -I .git $* 2>/dev/null'

# open file manager cwd
alias e.='nautilus . 2>/dev/null'

#export TERM=xterm-256colors
#export TERM=screen-256colors
#export TERM=gnome-256colors
#export TERM=mate-terminal

