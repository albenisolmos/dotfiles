let s:can_close_vim = 0 
let g:currentmode={
			\ 'n'  : 'N',
			\ 'no' : 'N·Operator Pending',
			\ 'v'  : 'V',
			\ 'V'  : 'V·Line',
			\ '' : 'V·Block',
			\ 's'  : 'Select',
			\ 'S'  : 'S·Line',
			\ 'x19': 'S·Block',
			\ 'i'  : 'I',
			\ 'R'  : 'R',
			\ 'Rv' : 'V·Replace',
			\ 'c'  : 'Command',
			\ 'cv' : 'Vim Ex',
			\ 'ce' : 'Ex',
			\ 'r'  : 'Prompt',
			\ 'rm' : 'More',
			\ 'r?' : 'Confirm',
			\ '!'  : 'Shell',
			\ 't'  : 'Term'
			\}

function s:set_hi(group, fg, bg)
	if a:fg != ''
		execute 'hi ' . a:group . ' guifg=' . a:fg
	endif
	if a:bg != ''
		execute 'hi ' . a:group . ' guibg=' . a:bg 
	endif
endfun

function s:writer_mode()
	if getwinvar(winnr(), '&number') == '0'
		setlocal number
		set showbreak=↳\ 
	else
		setlocal nonumber
		set showbreak=
	endif
endfun
command WriterMode call s:writer_mode()

function! IsCurrentWindow()
	if getwinvar(winnr(), 'curr')
		let newmode = mode()
		if newmode == 'i'
			hi User1 guibg=#FFAD57 ctermfg=236 ctermbg=215
			hi User1 guifg=#FFAD57 ctermfg=215 ctermbg=236
		elseif newmode == 'v' || newmode == 'V'
			hi User1 guibg=#B16286 ctermfg=236 ctermbg=96
			hi User2 guifg=#B16286 ctermfg=96 ctermbg=236 
		else
			hi User1 guibg=#505050 ctermfg=236 ctermbg=248
			hi User2 guifg=#505050 ctermfg=248 ctermbg=236 
		endif
	else
		call s:set_hi('User1', '', g:olmos_statusline_bg)
		call s:set_hi('User2', g:olmos_statusline_fg, '')
	endif

	return ''
endfun

function s:on_enter()
	if pumvisible()
		return "\<C-y>"
	elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
		return "\<CR>\<Esc>O"
	elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
		return "\<CR>\<Esc>O"
	else
		return "\<CR>"
	endif
endfun
imap <expr> <CR> <SID>on_enter()

function! s:toggle_statusline()
	if &laststatus == 0 || &laststatus == 1
		set laststatus=2
		set noshowmode
	else
		set laststatus=0
		set showmode
	endif
endfun
command ToggleStatusline call s:toggle_statusline()

function s:toggle_overlength()
	if &colorcolumn == 0
		set colorcolumn=80
	else
		set colorcolumn=0
	endif
endfun
command ToggleOverLength call s:toggle_overlength()
