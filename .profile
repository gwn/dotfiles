set -o vi  # vi mode

# bash prompt
function last_two_dirs {
    pwd | rev | awk -F / '{print $1,$2}' | rev | sed s_\ _/_
}
export PS1='$(last_two_dirs)$(__git_ps1 " @%s" | cut -c1-5)\$ '

export EDITOR=vim
export PAGER='less -RSi'

alias ls='ls -p --color'  # replace --color with -G on BSD variants, like OS X
alias dudu='du -hs * | sort -hr | head -5'
alias grep='grep --colour'
alias tmux='tmux -2u'
alias mysql="EDITOR='vim -c \"se ft=sql\"' mysql"
alias gitnp='git --no-pager'

source $HOME/.profile.extended
source $HOME/.git-prompt.sh  # git completion
source $HOME/.profile.local
