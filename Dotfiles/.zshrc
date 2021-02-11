# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Load aliases if existent.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Autocd
setopt autocd

# Colors
unset color_prompt force_color_prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M$fg[green]%}:%{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
alias grep="grep --color=auto"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff="diff --color=auto"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export ccat="highlight --out-format=ansi"

# Aliases
alias am="alsamixer"
alias cp="cp -rfv"
alias d1-p1="zenity --info --text "Complete" && paplay $HOME/.local/share/sounds/cause-and-effect.ogg"
alias du1="du -d1 -h"
alias ff="find "." -type f -iname "
alias fd="find "." -type d -iname "
alias ht="htop"
alias hy="history"
alias k9="kill -9"
alias ka="killall"
alias l="exa -al --color=always --group-directories-first"
alias mv="mv -fv"
alias nv="nvim"
alias pc="pavucontrol &"
alias pm="pacman"
alias pu="paru"
alias py="python3"
alias rm="rm -rfv"
alias sfm="spacefm"
alias spm="sudo pacman"
alias sth="sort -h"
alias snv="sudo -E nvim"
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
export FILEMANAGER="spacefm"
export TERMINAL="alacritty"
export TERM="xterm-color"
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export EDITOR="nvim"
export VISUAL="nvim"
export PATH=$PATH:$HOME/Scripts/Shell/
export PATH=$PATH:$HOME/Scripts/Shell/Autostart/
export PATH=$PATH:$HOME/Scripts/Shell/Games/
export PATH=$PATH:$HOME/Scripts/Shell/Polybar/
export PATH=$PATH:$HOME/Scripts/Shell/Programs/
export PATH=$PATH:$HOME/Scripts/Shell/Utils/
export PATH=$PATH:$HOME/Programs/Pycharm/bin/
export JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# System Info
neofetch

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null