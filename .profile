# prompt
function last_two_dirs {
    pwd |rev| awk -F / '{print $1,$2}' | rev | sed s_\ _/_
}
export PS1='$(last_two_dirs)> '

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

export EDITOR=vi

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# use gnu src-hilite with less
export LESSOPEN="|/usr/local/Cellar/source-highlight/3.1.7/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# enable forward incremental search by disabling XON/XOFF
stty -ixon

# source ranger plugins
# this must be modified to source all the files in the plugins directory
source ~/.config/ranger/plugins/bash_automatic_cd.sh

# aliases
alias l='ls'
alias ls='ls -Gp'
alias la='ls -a'
alias lv='l -1'
alias ll='l -l'

alias grep='grep --colour'
alias j=jobs
alias f=fg
alias clr=clear
alias x=clr

# git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gam="git commit -am"
alias gr="git remove"
alias gl="git log"
alias gd="git diff"
alias gb="git branch"

# taskwarrior
alias t=task
alias tt="t due.before:tomorrow"

# ledger
alias le="ledger -f $HOME/ledger/ege.ldg --pager cat"
alias bal="le balance"
alias ball="bal --color --force-color | less"
alias eq="bal ^assets ^liabilities"
alias cash="bal ^income ^expenses"
alias jour="vim $HOME/ledger/ege.ldg"
alias joura="cat >> $HOME/ledger/ege.ldg"
alias reg="le reg --color --force-color | less"

# gcalcli
alias c="gcalcli --cal egeavunc@gmail.com"
alias ch="c --cache"
alias cm="c calm"
alias cw="c calw"
alias ca="c agenda"
alias cad="ca --details all"
alias chm="ch calm"
alias chw="ch calw"
alias cha="ch agenda"
alias chad="ch agenda --details all"
alias cn="c add"
alias cdel="c delete"
alias ced="c edit"

# taskwarrior, ledger, gcalcli summary
alias rep='(date; printf "\n## CALENDAR ####################################################################\n"; ca; printf "\n\n## TASKS DUE TODAY #############################################################\n\n"; tt rc._forcecolor=on; printf "\n\n## FINANCES ####################################################################\n\n"; eq --color --force-color;) | less'

# wordnet
function wno() { wn $1 -over | fold -sw70 | less; }

# wikipedia
wiki() { dig +short txt $1.wp.dg.cx | fold -sw70 | less; }
