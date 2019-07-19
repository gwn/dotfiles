#!/bin/sh

set -o vi

test $TERM = linux && . $HOME/.env

alias sudo="sudo -E"
alias info='info --vi-keys'
alias ls="ls -p"
alias gi=git
alias grep="grep --color=auto"
alias bat="cat /sys/class/power_supply/BAT0/capacity"
alias batstat="cat /sys/class/power_supply/BAT0/status"
alias zth=zathura
alias pyg=pygmentize
alias news=newsboat
alias ircf='irc -s irc.freenode.net'
alias t="tree"
alias t2="tree -L 2"
alias t3="tree -L 3"
alias diary="$EDITOR $HOME/docs/diary/$(date --date='-6 hours' +%F).txt"

nmconf() {
    export NOTMUCH_CONFIG=$HOME/.notmuch-config.$1
}
