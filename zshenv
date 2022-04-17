path+=('/usr/local/lib/nodejs/bin' "$HOME/.cargo/bin" "$HOME/Download/software/lua-language-server/bin")

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH
export TERM="xterm-256color"
export COLORTERM=truecolor
export KEYTIMEOUT=1
export WWW_HOME="http://duckduckgo.com"
export GTK_OVERLAY_SCROLLING=0
export VIM="/usr/local/share/nvim"
export VIMRUNTIME="$VIM/runtime"
export EDITOR="nvim"
#export QT_STYLE_OVERIDE=GTK+

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	tmux attach -t default || tmux new -s default
fi
