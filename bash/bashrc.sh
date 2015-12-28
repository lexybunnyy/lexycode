# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Lexy BashRC fájlja Gites kliens-re
# Telepítendő dolgok: 
# sudo apt-get install git git-svn git-core ack ack-grep 
# Remélhetőleg nem kell de előfordulhat:
# sudo apt-get install mercurial apache2 libapache2-mod-passenger

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    color_prompt_real_check = yes 
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
#unset color_prompt force_color_prompt

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# ------------------------------------------------------------------------
if [ "`compgen -c ack`" ]; then
    ACK=`compgen -c ack | head -n 1`
    alias ack=${ACK}
    alias ackp="${ACK} --pager=less\ -R"
fi
# ------------------------------------------------------------------------
# This code was auto generated by with these options:
# http://andrewray.me/bash-prompt-builder/index.html#git=1&color-git=3&color-git-prefix=3&git-ahead=1&color-git-ahead=6b&git-modified=1&color-git-modified=3&color-git-conflicted=1&color-git-revno=3&color-git-bisect=5&color-option-submodule=5&color-git-ontag=3&hg=1&color-hg=5&color-hg-prefix=5&color-hg-modified=5&color-hg-conflicted=1&color-hg-revno=5&color-hg-bisect=3&color-hg-patches=3&svn=1&color-svn=6&color-svn-modified=6&color-svn-revno=6&option-modified=%E2%96%B3&option-conflict=%E2%98%A2&color-option-conflict=3&max-conflicted-files=2&option-nobranch=no%20branch!&color-option-nobranch=1&bisecting-text=bisecting&submodule-text=%5Bsubmodule%5D%20

MAX_CONFLICTED_FILES=2
DELTA_CHAR="△"
CONFLICT_CHAR="☢"
BISECTING_TEXT="bisecting"
NOBRANCH_TEXT="no branch!"
REBASE_TEXT="✂ ʀebase"
SUBMODULE_TEXT=""

# Colors for prompt
COLOR_RED=$(tput sgr0 && tput setaf 1)
COLOR_GREEN=$(tput sgr0 && tput setaf 2)
COLOR_YELLOW=$(tput sgr0 && tput setaf 3)
COLOR_BLUE=$(tput sgr0 && tput setaf 4)
COLOR_MAGENTA=$(tput sgr0 && tput setaf 5)
COLOR_CYAN=$(tput sgr0 && tput setaf 6)
COLOR_GRAY=$(tput sgr0 && tput setaf 7)
COLOR_WHITE=$(tput sgr0 && tput setaf 7 && tput bold)
COLOR_LIGHTRED=$(tput sgr0 && tput setaf 1 && tput bold)
COLOR_LIGHTGREEN=$(tput sgr0 && tput setaf 2 && tput bold)
COLOR_LIGHTYELLOW=$(tput sgr0 && tput setaf 3 && tput bold)
COLOR_LIGHTBLUE=$(tput sgr0 && tput setaf 4 && tput bold)
COLOR_LIGHTMAGENTA=$(tput sgr0 && tput setaf 5 && tput bold)
COLOR_LIGHTCYAN=$(tput sgr0 && tput setaf 6 && tput bold)

COLOR_RESET=$(tput sgr0)

_git_dir=""
_git_svn_dir=""
function _git_check {
    _git_dir=`git rev-parse --show-toplevel 2> /dev/null`
    if [[ "$_git_dir" == "" ]]; then
        return 1
    else
        _gsvn_check=`cd "$_git_dir"; ls .git/svn/.metadata 2> /dev/null`

        if [[ ! -z "$_gsvn_check" ]]; then
            _git_svn_dir=$_git_dir
        fi
        return 0
    fi
}

function is_submodule() {
    local parent_git=`cd "$_git_dir/.." && git rev-parse --show-toplevel 2> /dev/null`
    if [[ -n $parent_git ]]; then
        local submodules=`cd "$parent_git" && git submodule --quiet foreach 'echo $path'`
        for line in $submodules; do
            cd "$parent_git/$line"
            if [[ `pwd` = $_git_dir ]]; then return 0; fi
        done
    fi
    return 1
}

dvcs_function="
    # Figure out what repo we are in
    _git_check \

    # Build the prompt!
    prompt=\"\"

    # If we are in git ...
    if [ -n \"\$_git_dir\" ]; then
        # find current branch
        gitBranch=\$(git symbolic-ref HEAD 2> /dev/null)
        gitStatus=\`git status\`

        # Figure out if we are rebasing
        if [[ -d \"\$_git_dir/.git/rebase-apply\" || -d \"\$_git_dir/.git/rebase-merge\" ]]; then
            is_rebase=1
        fi

        # Figure out current branch, or if we are bisecting, or lost in space
        bisecting=\"\"
        if [ -z \"\$gitBranch\" ]; then
			if [ -n \"\$is_rebase\" ]; then
				rebase_prompt=\" \\[\$COLOR_LIGHT_CYAN\\]\"
				rebase_prompt=\$rebase_prompt\"\\[`tput sc`\\]  \\[`tput rc`\\]\\[\$REBASE_TEXT\\] \"
				rebase_prompt=\$rebase_prompt\"\\[\$COLOR_YELLOW\\]\"
			else
				gitBranch=\"\\[\$COLOR_RED\\]\$NOBRANCH_TEXT\\[\$COLOR_YELLOW\\]\"
			fi
        fi
        gitBranch=\${gitBranch#refs/heads/}
        #: git-svn
        if [ -z \"\$bisect\" ]; then
            if [ -n \"\$_git_svn_dir\" ]; then
                gitBranch=\"\\[\$COLOR_DARK_BLUE\\]git-svn\\[\$COLOR_YELLOW\\] \$gitBranch\"
            fi
        fi

            
        if [ -z \"\$is_rebase\" ]; then
            # changed *tracked* files in local directory?
            gitChange=\$(echo \$gitStatus | ack 'modified:|deleted:|new file:')
            if [ -n \"\$gitChange\" ]; then
                gitChange=\"\\[\$COLOR_YELLOW\\] \\[`tput sc`\\]  \\[`tput rc`\\]\\[\$DELTA_CHAR\\] \"
            fi
        fi

        # output the branch and changed character if present
        prompt=\$prompt\"\\[\$COLOR_YELLOW\\]\"

        if is_submodule; then
             prompt=\$prompt\"\\[\$COLOR_MAGENTA\\]\$SUBMODULE_TEXT\\[\$COLOR_YELLOW\\]\"
        fi

        prompt=\$prompt\$prefix\$gitBranch\$bisecting
        prompt=\$prompt\"\$gitChange\\[\$COLOR_YELLOW\\]\\[\$COLOR_RESET\\]\"

        # How many local commits do you have ahead of origin?
        num=\$(echo \$gitStatus | grep \"Your branch is ahead of\" | awk '{split(\$0,a,\" \"); print a[13];}') || return
        if [ -n \"\$num\" ]; then
             prompt=\$prompt\"\\[\$COLOR_CYAN\\] +\$num\"
            fi

        fi

    echo -e \$prompt"
# End code auto generated by http://andrewray.me/bash-prompt-builder/index.html

PS1="\$(${dvcs_function})\[$COLOR_RESET\] \$ "

# -----------------------------------------------------------------------------------
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
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
bold=$(tput bold)
reset=$(tput sgr0)
function parse_git_dirty {
[[ $(git status 2> /dev/null | tail -n1) != 'nothing to commit (working directory clean)' ]] && echo $red || echo $green
}
function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/\* \(.*\)/\1/"
}


if [ "$color_prompt" = yes ]; then
    PS1="\[$bold\]\[$green\]\u\[$reset\]@\[$bold\]\[$yellow\]\h\[$reset\]:\[$bold\]\[$blue\]\w\[$reset\]:\[\$(parse_git_dirty)\]\$(parse_git_branch)\[\$reset\]\$ "
else
    PS1='\u@\h:\W:$(parse_git_branch) " (%s)")\$ '
fi
#unset color_prompt force_color_prompt


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

# --------------------------------------------------


short_dir="\[\e[00;36m\]\W\[\e[0m\]" 
long_dir="\[$bold\]\[$blue\]\w\[$reset\]"
git_just_branch="\[\$(parse_git_dirty)\]\$(parse_git_branch)\[\$reset\]"
git_info_branch="\$(${dvcs_function})\[$reset\]"

if [ "$color_prompt" = yes ]; then
	PS1="\[$bold\]\[$green\]\u\[$reset\]@\[$bold\]\[$yellow\]\h\[$reset\]:"
	PS1="$PS1[$short_dir]($git_info_branch) \$ \n\$ "
else
    PS1="\u@\h[\w]($git_info_branch) \$ \n\$ "
fi
unset color_prompt force_color_prompt