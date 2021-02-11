# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# ================================================================= #

# Autocd
setopt autocd

# Colors
unset color_prompt force_color_prompt
# export PS1="\[\e[0;31m\][\[\e[1;33m\]\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[1;37m\]:\[\e[1;34m\]\w\[\e[0;31m\]]\[\e[1;37m\]$ \[\e[m\]"
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
alias ht="htop"
alias hy="history"
alias mv="mv -fv"
alias nv="nvim"
alias pm="pacman"
alias pu="paru"
alias py="python3"
alias rm="rm -rfv"
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
export FILEMANAGER="nautilus"
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