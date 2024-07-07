#!/bin/sh

set -o vi

source $HOME/.env

alias sudo="sudo "
# https://askubuntu.com/a/22043
# https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Aliases

alias e="vim \`fzf\`"
alias stl="systemctl"
alias jtl="journalctl"
alias info='info --vi-keys'
alias ls="ls -p"
alias dk=docker
alias grep="grep --color=auto"
alias zth=zathura
alias pyg=pygmentize
alias news=newsboat
alias ircf='irc -s irc.freenode.net'
alias t="tree"
alias t2="tree -L 2"
alias t3="tree -L 3"
alias diary="$EDITOR $HOME/docs/diary/$(date --date='-6 hours' +%F).txt"
alias lstypes='ls | rev | cut -d. -f1 | rev | sort | uniq -c | sort -nr'
alias b=bitcoin-cli
alias br='bitcoin-cli -regtest'
alias gi=git

j() { cd $(find ${1:-.} -type d | fzf); }

gitCmd=gi ## default is "git". Useful for aliases
source /usr/share/git/completion/git-completion.bash

complete -o bashdefault -o default -o nospace -F _git $gitCmd 2>/dev/null \
    || complete -o default -o nospace -F _git $gitCmd


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

