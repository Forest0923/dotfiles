#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias llh='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

alias up='cd ..'

PS1='\[\e[31m\]\u\[\e[37m\]@\[\e[34m\]\h \[\e[33m\]\W\[\e[m\] \$ '
