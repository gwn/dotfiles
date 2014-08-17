# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG="en_US.UTF-8"

# enable vim mode
bindkey -v
bindkey "^W" backward-kill-word    # vi-backward-kill-word
bindkey "^H" backward-delete-char  # vi-backward-delete-char
bindkey "^U" backward-kill-line    # vi-kill-line
bindkey "^?" backward-delete-char  # vi-backward-delete-char
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ege/.composer/vendor/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR=vi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# alias grep='grep --colour'
alias j=jobs
alias f=fg
alias x=clear

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

# wordnet
function wno() { wn $1 -over | fold -sw70 | less; }

# wikipedia
wiki() { dig +short txt $1.wp.dg.cx | fold -sw70 | less; }
