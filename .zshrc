# tmux
if [[ "$TMUX" = "" && $TERM_PROGRAM != "vscode" ]]; then
	tmux;
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char
bindkey '^[[Z' reverse-menu-complete

# Alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alFh'
alias llt='ls -alFht'
alias la='ls -A'
alias l='ls -CF'

alias tree='tree -C'

alias up='cd ..'

# Prompt
## git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '(%b)'
## ssh
if [[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]];then
	ISSSH="%K{yellow}%F{black}SSH%k%f"
fi
## color
autoload -U colors && colors
PROMPT="${ISSSH}%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~%{$reset_color%}\${vcs_info_msg_0_} %# "

# Auto-complete
zstyle :compinstall filename '/home/mori/.zshrc'
autoload -Uz compinit
compinit
