export ZDOTDIR=$HOME/.config/zsh

stty stop undef # Disable ctrl-s to freeze terminal.
source "$ZDOTDIR/functions"
zsh_add_file "aliases"
zsh_add_file "prompt"

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
#zstyle ':completion:*' file-sort modification
#zstyle ':completion:*:*:cp:*' file-sort size
#zstyle ':completion:*' completer _expand_alias _complete _ignored

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
