#
# ~/.bashrc
#

# tmux
if [ -z $TMUX ]; then
	if [ $TERM_PROGRAM == vscode ]; then
		tmux new 2> /dev/null
	else
		tmux attach 2> /dev/null || `cd ~; tmux new` 2> /dev/null
	fi
fi

# Variables
if type nvim > /dev/null 2>&1; then
	export SUDO_EDITOR=nvim
elif type vim > /dev/null 2>&1; then
	export SUDO_EDITOR=vim
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias
if type exa > /dev/null 2>&1; then
	alias ls='exa'
	alias l='exa'
	alias ll='exa -alh --git'
	alias la='exa -a'
	alias tree='exa -T'
else
	alias ls='ls --color=auto'
	alias l='ls -CF'
	alias ll='ls -alF'
	alias la='ls -A'
fi

if [[ -f /usr/bin/bat ]]; then
	alias cat='bat'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias up='cd ..'

PS1='\[\e[31m\]\u\[\e[37m\]@\[\e[34m\]\h \[\e[33m\]\W\[\e[m\] \$ '

if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    LS_COLORS="${LS_COLORS}:ow=01;34";
    export LS_COLORS;
    cd ~;
fi
