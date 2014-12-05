# prompt
function last_two_dirs {
    pwd |rev| awk -F / '{print $1,$2}' | rev | sed s_\ _/_
}
export PS1='$(last_two_dirs)> '

export EDITOR=vi

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# enable forward incremental search by disabling XON/XOFF
stty -ixon

# source ranger plugins
# this must be modified to source all the files in the plugins directory
# source ~/.config/ranger/plugins/bash_automatic_cd.sh

# aliases
alias l='ls'
alias ls='ls -Gp'
alias la='ls -a'
alias lv='l -1'
alias ll='l -la'

alias grep='grep --colour'
alias j=jobs
alias f=fg
alias clr=clear
alias x=clr

# taskwarrior
alias t=task
alias tt="t due.before:tomorrow"
alias ttw="t due.before:mon"
alias ttm="t due.before:eom"

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

# newsbeuter workaround
alias newsbeuter="LANG=en_GB newsbeuter"

# wordnet
function wno() { wn $1 -over | fold -sw70 | less; }

# wikipedia
wiki() { dig +short txt $1.wp.dg.cx | fold -sw70 | less; }
