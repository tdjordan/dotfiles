#echo .profile
[ "$0" != "dash" ] && . ~/.paths && return
[ "$0"  = "dash" ] && . ~/.paths && return
#echo final

export PATH="$HOME/.cargo/bin:$PATH"
