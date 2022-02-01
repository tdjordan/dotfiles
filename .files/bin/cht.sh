#!/bin/bash

languages=$(echo "golang lua cpp c typescript nodejs" | tr ' ' '\n')
core_utils=$(echo "xargs find mv sed awk" | tr ' ' '\n')

selected=$(printf "%s\n%s" "$languages" "$core_utils" | sk)
read -rp "query: " query

if printf "%s" "$languages" | rg -q "$selected"; then
  tmux new-window bash -c "curl cht.sh/$selected/$(echo query | tr ' ' '+') & while [ : ]; do sleep 1; done"
else
  tmux new-window bash -c "curl cth.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
