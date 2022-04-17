HISTCONTROL=ignoreboth #History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Alias
alias poweroff="sudo systemctl poweroff"
alias logout="kill -9 -1"
alias r="ranger"
alias g="git"
alias v="nvim"
alias s="sudo"
alias rcd=". ranger"
alias gobanks="vim ~/Documents/accounts/banks"
alias gomimes="vim ~/Documents/accounts/mime"
alias gopatria="vim ~/Documents/accounts/patria"
alias goremember="vim ~/Documents/remember/"
alias govimrc="nvim ~/.config/nvim/init.vim"
alias gozshrc="nvim ~/.config/zshrc"
alias golfrc="nvim ~/.config/lf/lfrc"
alias ihasw="ping www.google.com"
alias vim="nvim"
alias our="node ~/Dev/our/src/index.js"
alias ifind="find . -type f | xargs grep -l"
alias iweighdir="du -hsx .* | sort -rh | head -n 40"
alias luamake=/home/olmos/Downloads/software/lua-language-server/3rd/luamake/luamake
alias intmux="tmux attach -t default || tmux new -s default"
alias mkreinstall="make build && sudo make uninstall && sudo make install"
alias mk="make build && ./main"

autoload -U colors && colors #Enable colors and change prompt:
autoload -Uz vcs_info #Load version control information
autoload edit-command-line
zle -N edit-command-line # Edit line in vim with ctrl-e:

setopt histappend # append andnnnnn no toverwrite history
setopt menu_complete

precmd() { vcs_info }
 
# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:*:cp:*' file-sort size
zstyle ':completion:*' completer _expand_alias _complete _ignored
zstyle ':vcs_info:git:*' formats '%b' #Format the vcs_info_msg_0_ variable
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

bindkey -v #vi mode
bindkey '^e' edit-command-line
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey -M menuselect '^M' .accept-line
bindkey -s '^o' 'lfcd\n'

function set_prompt() {
	if ! [[ ${vcs_info_msg_0_} = "" ]]; then
		local branch="[${vcs_info_msg_0_}] "
	fi
	if ! [[ ${(%):-%1d} = $USER ]]; then
		local current_dir="%1d "
	fi
	PS1=" $branch$current_dir%(0?.%F{5}.%F{red})$%{$reset_color%} "
}
typeset -a precmd_functions
precmd_functions+=(set_prompt)

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init

LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
	source "$LFCD"
fi
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} #Use beam shape cursor new prompt.
stty -ixon

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
