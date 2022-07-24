export ZDOTDIR=$HOME/.config/zsh

stty stop undef # Disable ctrl-s to freeze terminal.
source "$ZDOTDIR/functions"
zsh_add_file "prompt"

alias poweroff="sudo systemctl poweroff"
alias logout="kill -9 -1"
alias l="lf"
alias g="git"
alias v="nvim"
alias s="sudo"
alias gobanks="nvim ~/Documents/accounts/banks"
alias gomimes="nvim ~/Documents/accounts/mime"
alias gopatria="nvim ~/Documents/accounts/patria"
alias goremember="nvim ~/Documents/remember/"
alias govimrc="nvim ~/.config/nvim/init.vim"
alias gozshrc="nvim ~/.config/zshrc"
alias golfrc="nvim ~/.config/lf/lfrc"
alias ihasw="ping www.google.com"
alias ifind="find . -type f | xargs grep -l"
alias iweighdir="du -hsx .* | sort -rh | head -n 40"
alias luamake=/home/olmos/Downloads/software/lua-language-server/3rd/luamake/luamake
alias intmux="tmux attach -t default || tmux new -s default"
alias mkreinstall="make build && sudo make uninstall && sudo make install"
alias mk="make build && ./main"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# enable only git 
#zstyle ':vcs_info:*' enable git 
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %F{#8c7e6a}%b |'

setopt PROMPT_SUBST
PROMPT='${vcs_info_msg_0_} %F{#8c7e6a}%~ %B%(0?.%F{5}.%F{red})$ %{$reset_color%}'

autoload -U colors && colors # colors
zle_highlight=('paste:none')

# Edit line in vim with ctrl-e:
autoload edit-command-line
zle -N edit-command-line 

#setopt histappend # append and no overwrite history
setopt menu_complete
unsetopt BEEP
zle_highlight=('paste:none')

setopt inc_append_history share_history
SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=~/.config/zsh/history

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select

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

echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} #Use beam shape cursor new prompt.

# Plugins
[ -f "$HOME/.config/lf/lfcd.sh" ] && source "$HOME/.config/lf/lfcd.sh"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_completion "esc/conda-zsh-completion" false
zsh_add_plugin "dracula/zsh-syntax-highlighting"
#zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
