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

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Enable programmable completion.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Autocd
shopt -s autocd

# Colors
unset color_prompt force_color_prompt
export PS1="[\[\e[1;33m\]\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[0;31m\]:\[\e[1;34m\]\w\[\e[m\]]\[\e[1;37m\]$ \[\e[m\]"
alias grep="grep --color=auto"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff="diff --color=auto"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export ccat="highlight --out-format=ansi"

# Aliases
alias am="alsamixer"
alias cp="cp -rfv"
alias dp="dolphin"
alias du1="du -d1 -h"
alias ff="find "." -type f -iname "
alias fd="find "." -type d -iname "
alias k9="kill -9"
alias ka="killall"
alias D1-P1="zenity --info --text "Complete" && paplay $HOME/.local/share/sounds/cause-and-effect.ogg"
alias l="exa -al --color=always --group-directories-first"
alias ksg="ksysguard &"
alias ht="htop"
alias hy="history"
alias mv="mv -fv"
alias pm="pacman"
alias py="python3"
alias rm="rm -rfv"
alias spm="sudo pacman"
alias sth="sort -h"
alias sv="sudo -E vim"
alias wrt="wrestool -x --output=. -t14"
alias yt="youtube-dl --add-metadata -ic"

# Git aliases
alias gcl="git clone"
alias ga="git add"
alias gcm="git commit -m"
alias gpm="git push -u origin master"

# Environment Games
# export WINEFSYNC=1
# export MANGOHUD=1
# export MANGOHUD_DLSYM=1
# export ENABLE_VKBASALT=1
export VKBASALT_CONFIG_FILE="$HOME/.config/vkBasalt/vkBasalt.conf"

# Environment
export BROWSER="firefox"
export FILEMANAGER="pcmanfm"
export TERMINAL="alacritty"
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export EDITOR="vim"
export EDITOR VISUAL
export VISUAL=$EDITOR
export PATH=$PATH:$HOME/Scripts/Bash/
export PATH=$PATH:$HOME/Scripts/Bash/Autostart/
export PATH=$PATH:$HOME/Scripts/Bash/Games/
export PATH=$PATH:$HOME/Scripts/Bash/Polybar/
export PATH=$PATH:$HOME/Scripts/Bash/Programs/
export PATH=$PATH:$HOME/Scripts/Bash/Utils/
export PATH=$PATH:$HOME/Programs/Pycharm/bin/
export JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# System Info
neofetch
