#!/usr/bin/env zsh

languages=`echo "cpp c python lua" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr ' ' '\n'` 

selected=`printf "$languages\n$core_utils" | fzf`
printf "query: "
read query

if printf $languages | grep -qs $selected; then
   tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
   tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
