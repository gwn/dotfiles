#!/bin/sh

set -o vi

export EDITOR=vim
export PYTHONPATH=/usr/local/lib/python3.6/site-packages
export GOPATH=$HOME/go
export NODE_PATH=/usr/lib/node_modules
export PATH=$PATH:$HOME/.config/bin:$GOPATH/bin
export PLAN9=$HOME/src/plan9port

alias ls="ls -p"
alias l="ls -1"
alias gi=git
alias bat="cat /sys/class/power_supply/BAT0/capacity"
alias diary="$EDITOR $HOME/docs/diary/$(date --date='-6 hours' +%F).txt"
alias zth=zathura
alias pyg=pygmentize
alias falot="mpop uv && notmuch new && alot"

alias weather="curl wttr.in/~Istanbul?0"

alias t="tree"
tl() { tree "$1" | less; }
alias t2="tree -L 2"

alias td="tree -d"
tdl() { tree -d "$1" | less; }
alias td2="tree -dL 2"

stfont() {
    cd ~/src/suckless/st || return

    sed -i 's/\(^static char font\[\] = "[a-zA-Z]\+:pixelsize=\)[0-9]\+\(.\+\)/\1'"$1"'\2/' config.h && \
    make && \
    sudo make install

    cd - || return
}

activatenet() {
    sudo ip link set wlp2s0 up
}

conwpa() {
    passphraseFile="$1"

    if ! test -f "$passphraseFile"; then
      echo "Given passphrase file does not exist!"
      return 1
    fi

    sudo killall wpa_supplicant
    activatenet
    sleep 2
    sudo wpa_supplicant -B -D n180211,wext -i wlp2s0 -c "$passphraseFile"
    sleep 2
    sudo dhcpcd
    watch ip route show
}

scanwifi() {
    networkListFile="$1"

    activatenet
    sudo iw dev wlp2s0 scan | tee "$networkListFile" | grep SSID
}

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

radio() {
    radiodb=$HOME/radios.csv
    selectedChannelName=
    selectedChannelURL=

    if ! test -f "$radiodb"; then
        echo "No radio db file!"
        return
    fi

    if test -n "$1"; then
        selectedChannelName="$1"
    else
        selectedChannelName=$(<"$radiodb" cut -d , -f 1 | vis-menu -l 10)
    fi

    selectedChannelURL=$(grep "$selectedChannelName" "$radiodb" | cut -d , -f 2)

    mpv "$selectedChannelURL"
}
