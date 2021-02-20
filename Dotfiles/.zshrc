# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh_history

# Autocd
setopt autocd

# Auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Bind keys, "showkey -a" to see output of a key.
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Colors
unset color_prompt force_color_prompt
autoload -U colors && colors
PS1="%B%{%F{red}[%}%F{yellow}%}%n%{%F{green}%}@%{%F{blue}%}%m%{%F{green}%}:%F{magenta}%}%~%F{red}]%}%{%f%}$%b "
alias diff='diff --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
export GREP_COLOR='1;32'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export CLICOLOR=1
export TERM='xterm-256color'

# Environment
export BROWSER="firefox"
export FILEMANAGER="spacefm"
export TERMINAL="alacritty"
export EDITOR="nvim"
export VISUAL="nvim"
export JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export PATH=$PATH:$HOME/Scripts/Shell/
export PATH=$PATH:$HOME/Scripts/Shell/Autostart/
export PATH=$PATH:$HOME/Scripts/Shell/Games/
export PATH=$PATH:$HOME/Scripts/Shell/Polybar/
export PATH=$PATH:$HOME/Scripts/Shell/Programs/
export PATH=$PATH:$HOME/Scripts/Shell/Utils/
export PATH=$PATH:$HOME/Programs/Pycharm/bin/

# Environment Games
# export WINEFSYNC=1
# export MANGOHUD=1
# export MANGOHUD_DLSYM=1
# export ENABLE_VKBASALT=1
#export VKBASALT_CONFIG_FILE="$HOME/.config/vkBasalt/vkBasalt.conf"

# Load aliases if exist.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

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
alias lns="ln -sf"
alias mv="mv -fv"
alias nv="nvim"
alias pc="pavucontrol &"
alias pm="pacman"
alias pu="paru"
alias py="python3"
alias pyc="pycharm.sh"
alias rlz="source .zshrc"
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

# System Info
neofetch

# Load zsh-autosuggestions.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
