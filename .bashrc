#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# tmux
if [ -z $TMUX ]; then
	if [[ $TERM_PROGRAM == vscode ]]; then
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

# Alias
if type eza &> /dev/null; then
	alias ls='eza'
	alias l='eza -l --git'
	alias ll='eza -l --git'
	alias lh='eza -lh --git'
	alias la='eza -lah --git'
	alias tree='eza -T'
elif type exa &> /dev/null; then
	alias ls='exa'
	alias l='exa -l --git'
	alias ll='exa -l --git'
	alias lh='exa -lh --git'
	alias la='exa -lah --git'
	alias tree='exa -T'
else
	alias ls='ls --color=auto'
	alias l='ls -l --color=auto'
	alias ll='ls -l --color=auto'
	alias lh='ls -lh --color=auto'
	alias la='ls -lah --color=auto'
	#alias tree='tree -C'
fi

if [[ -f /usr/bin/bat ]]; then
	alias cat='bat'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias up='cd ..'
alias refsh='exec `which bash` -l'

PS1='\[\e[31m\]\u\[\e[37m\]@\[\e[34m\]\h \[\e[33m\]\W\[\e[m\] \$ '

if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    LS_COLORS="${LS_COLORS}:ow=01;34";
    export LS_COLORS;
    cd ~;
fi

# Completion
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

