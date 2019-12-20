# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


if [ -f ~/dotfiles/myfuncs.sh ]; then
  source ~/dotfiles/myfuncs.sh
fi
# # show original function
# function myfunc(){
#     if [ $# -ne 0 ]; then
#         echo "ERROR: Invalid argument";
#         return 1;
#     fi
#     echo "-----"
#     echo "NAME"
#     echo "    init_report"
#     echo "USAGE"
#     echo "    $ init_report [LocalDirName] [ReportRepositoryName]"
#     echo -e "-----\n"
# 
#     echo "-----"
#     echo "NAME"
#     echo "    mkpdf"
#     echo "USAGE"
#     echo "    $ mkpdf [OPTION] [FILE]"
#     echo "OPTION"
#     echo "    -d, --draft"
#     echo -e "-----\n"
# 
#     echo "-----"
#     echo "NAME"
#     echo "    rm_latex_useless"
#     echo "USAGE"
#     echo "    $ rm_latex_useless"
#     echo -e "-----\n"
# }
# 
# 
# # clone report template from my repository
# function init_report(){
#     if [ $# -ne 2 ]; then
# 	echo "ERROR: Invalid argument";
# 	return 1;
#     fi
#     git clone git@github.com:forest0923/report-template.git $1;
#     if [ $? -ne 0 ]; then
# 	return 1;
#     fi
#     echo -e "# finished cloning\n";
#     cd $1;
#     rm -rf .git;
#     echo "# $2" > README.md;
#     git init;
#     echo -e "# finished initialising\n";
#     git add *;
#     echo -e "# finished adding\n";
#     git commit -m "first commit";
#     echo -e "# finished commiting\n";
#     git remote add origin git@github.com:forest0923/$2.git;
#     git push -u origin master;
#     cd ..;
# }
# 
# # platex
# function mkpdf(){
#     if [ $# -eq 1 ]; then
# 	FILENAME=$1
# 	SPLITNAME=${FILENAME%\.tex}
# 	sed -i -e "s/\\documentclass\[a4paper,\ draft\]{jsarticle}/\documentclass[a4paper]{jsarticle}/" $SPLITNAME.tex
#         
#     elif [ $# -eq 2 ]; then
# 	if [ $1 = "-d" -o $1 = "--draft" ]; then
# 	    FILENAME=$2
# 	elif [ $2 = "-d" -o $2 = "--draft" ]; then
# 	    FILENAME=$1
# 	else
# 	    echo "ERROR: Invalid argument"
# 	    echo "comand: mkpdf [OPTION(-d, -draft)] [FILENAME]"
# 	    return 1
# 	fi
# 	SPLITNAME=${FILENAME%\.tex}
# 	sed -i -e "s/\\documentclass\[a4paper\]{jsarticle}/\documentclass[a4paper, draft]{jsarticle}/" $SPLITNAME.tex
#         
#     else
# 	echo "ERROR: Invalid argument"
# 	echo "comand: mkpdf [OPTION(-d, -draft)] [FILENAME]"
# 	return 1
#     fi
#     
#     echo -en "$SPLITNAME.tex -> $SPLITNAME.dvi\n[1]"
#     platex -interaction=nonstopmode -shell-escape $SPLITNAME.tex > /dev/null
#     if [ $? -ne 0 ]; then
# 	echo -e "\nERROR: platex"
# 	return 1
#     fi
#     echo  "[2]"
#     platex -interaction=nonstopmode -shell-escape $SPLITNAME.tex > /dev/null
#     dvipdfmx $SPLITNAME.dvi
#     rm_latex_useless
# }
# 
# function rm_latex_useless(){
#     if [ $# -ne 0 ]; then
# 	echo "ERROR: Invalid argument"
# 	return 1
#     fi
#     rm *.log *.aux *.cls *.dvi 2> /dev/null
# }
