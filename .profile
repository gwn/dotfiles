#!/bin/sh

set -o vi

. $HOME/.env

alias sudo='sudo -E'
alias ls="ls -p"
alias l="ls -1"
alias gi=git
alias grep="grep --color=auto"
alias grepN="grep --exclude-dir node_modules"
alias bat="cat /sys/class/power_supply/BAT0/capacity"
alias diary="$EDITOR $HOME/docs/diary/$(date --date='-6 hours' +%F).txt"
alias zth=zathura
alias pyg=pygmentize
alias falot="mpop pri && notmuch new && alot"
alias tms=transmission-cli
alias tms-show=transmission-show
alias cg=cargo
alias news=newsboat
alias ircf='irc -s irc.freenode.net'
alias weather="curl wttr.in/~Istanbul?0"
alias t="tree"
alias t2="tree -L 2"
alias td="tree -d"
alias td2="tree -dL 2"

dock() {
    xmodmap /etc/X11/xinit/.Xmodmap.hhkb
    xrandr --output VGA1 --auto --primary --above LVDS1
    sh ~/.xprofile
}

semidock() {
    xmodmap /etc/X11/xinit/.Xmodmap.hhkb
    sh ~/.xprofile
}

undock() {
    xmodmap /etc/X11/xinit/.Xmodmap
    xrandr --output VGA1 --off
    sh ~/.xprofile
}
