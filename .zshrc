# tmux
if [ "$TMUX" = "" ]; then
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
autoload -U colors && colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "
# RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

# Auto-complete
zstyle :compinstall filename '/home/mori/.zshrc'
autoload -Uz compinit
compinit
