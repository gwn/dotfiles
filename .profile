source .git-prompt.sh

# prompt
function last_two_dirs {
    pwd |rev| awk -F / '{print $1,$2}' | rev | sed s_\ _/_
}
export PS1='$(last_two_dirs)$(__git_ps1 " @%s" | cut -c1-5)\$ '

export EDITOR=vi

export PAGER=less

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# use gnu src-hilite with less
export LESSOPEN="|/usr/local/Cellar/source-highlight/3.1.7/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

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
alias ll='l -l'

alias grep='grep --colour'
alias j=jobs
alias f=fg
alias x=clear
alias h=hostname

# tmux
alias ta="tmux -2 attach -t"
alias tls="tmux ls"

# ranger
alias rr="ranger"

# taskwarrior
alias t=task
alias tt="t due.before:tomorrow"
alias ttw="t due.before:mon"
alias ttm="t due.before:eom"

# vit
alias vitt="vit due.before:tomorrow"

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

# go to root of current project/task, which is read from $PROJROOT
cdr() { cd $PROJROOT; }

