# Path
if [ -z $TMUX ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# tmux
if [[ -z $TMUX && $TERM_PROGRAM != "vscode" ]]; then
	tmux attach 2> /dev/null || {cd ~; tmux new}
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
if [ -f /usr/bin/exa ]; then
	alias ls='exa'
	alias l='exa'
	alias ll='exa -alh --git'
	alias la='exa -a'
	alias tree='exa -T'
else
	alias ls='ls --color=auto'
	alias l='ls -CF'
	alias ll='ls -alFh'
	alias la='ls -A'
	alias tree='tree -C'
fi

if [ -f /usr/bin/bat ]; then
	alias cat='bat'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias up='cd ..'

alias refresh_shell='exec $SHELL -l'

if [ -f /usr/bin/youtube-dl ] || [ -f $HOME/.local/bin/youtube-dl ]; then
	youtube_mp3() {
		youtube-dl $1 -f bestaudio --extract-audio
	}
	youtube_mp4() {
		youtube-dl $1 -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]"
	}
fi

if [ -f /usr/share/nvm/init-nvm.sh ]; then
	source /usr/share/nvm/init-nvm.sh
fi

ssh-add-keys() {
	eval `ssh-agent -s`
	find ~/.ssh -type f -name "id_*" -not -name "*.pub" | zargs ssh-add
}

## OCaml
[[ ! -r /home/mori/.opam/opam-init/init.zsh ]] || source /home/mori/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

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
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

# Import local files
if [ -d $HOME/dotfiles/local ];then
	array=($(find $HOME/dotfiles/local -type f))
	for each_file in ${array[@]}; do
		source ${each_file}
	done
fi

# WSL
if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
	LS_COLORS="${LS_COLORS}:ow=01;34";
	export LS_COLORS;
	if [[ -z $TMUX  &&  $TERM_PROGRAM != "vscode" ]]; then
		cd ~;
	fi
fi
