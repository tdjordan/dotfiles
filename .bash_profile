# shellcheck shell=bash
# shellcheck disable=SC1090
[ -r ~/.profile ] && . ~/.profile # Load the default .profile

# source /Users/thomasjordan/.config/broot/launcher/bash/br

. "$HOME/.cargo/env"

#AWSume alias to source the AWSume script
alias awsume="source awsume"

#Auto-Complete function for AWSume
_awsume() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(/nix/store/3wrbsxqiznd8k6g8f71h67j5xf8mck5v-awsume-4.5.5/bin/awsume-autocomplete)
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _awsume awsume
