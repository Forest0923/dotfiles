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

supp() {
	"$@" &> /dev/null < /dev/null
}

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
	find ~/.ssh -type f -name "id_*" -not -name "*.pub" | xargs ssh-add
}

wol_home() {
	if [ -f $HOME/dotfiles/local/config.toml ]; then
		$HOME/dotfiles/scripts/wol.py
		echo "Magic packet is sended!"
	else
		echo "~/dotfiles/local/config.toml doesn't exist!"
	fi
}

ipmitool_on() {
	if [ ! -e `where ipmitool` ]; then
		echo "ipmitool not found"
		return 1
	fi
	if [ $# = 0 ]; then
		echo "Please specify hostname"
		return 1
	fi
	$HOME/dotfiles/scripts/ipmitool.py $1 "on"
}

ipmitool_off() {
	if [ ! -e `where ipmitool` ]; then
		echo "ipmitool not found"
		return 1
	fi
	if [ $# = 0 ]; then
		echo "Please specify hostname"
		return 1
	fi
	$HOME/dotfiles/scripts/ipmitool.py $1 "off"
}

resize_monitor() {
	PRIMARY=`xrandr | grep "connected primary" | awk '{print $1}'`
	SECONDARY=`xrandr | grep "connected [0-9]\+x" | awk '{print $1}'`
	case $1 in
		"4k")
			xrandr --output $PRIMARY --mode 3840x2160 --scale 0.75x0.75
			;;
		"wqhd")
			xrandr --output $PRIMARY --mode 2560x1440 --scale 1.25x1.25
			;;
		"home")
			xrandr \
				--output eDP1 --mode 2560x1440 --scale 1.25x1.25 --pos 0x0 \
				--output $SECONDARY --mode 3840x2160 --scale 1.5x1.5 --pos 3200x0
			;;
		"asg")
			xrandr \
				--output eDP1 --mode 2560x1440 --scale 1.25x1.25 --pos 0x2880 \
				--output $SECONDARY --mode 2560x1440 --scale 2x2 --pos 0x0
			;;
		*)
			echo "Usage:"
			echo "    resize_monitor 4k     # for 4k monitor"
			echo "    resize_monitor wqhd   # for wqhd monitor"
			echo "    resize_monitor home   # home setting"
			echo "    resize_monitor asg    # asg setting"
			;;
	esac
}

# OCaml
[[ ! -r /home/mori/.opam/opam-init/init.zsh ]] || source /home/mori/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export GIT_EDITOR=vim

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

# Import Scripts
if [ -d $HOME/dotfiles/scripts ];then
	for src in `find $HOME/dotfiles/scripts -type f -name "*.sh"`; do
		source ${src}
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
