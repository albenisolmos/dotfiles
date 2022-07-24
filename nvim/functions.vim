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
			\ 'c'  : 'CMD',
			\ 'cv' : 'Vim Ex',
			\ 'ce' : 'Ex',
			\ 'r'  : 'Prompt',
			\ 'rm' : 'More',
			\ 'r?' : 'Confirm',
			\ '!'  : 'Shell',
			\ 't'  : 'Term'
			\}

let g:last_mode=''
function! IsCurrentWindow()
	if getwinvar(winnr(), 'curr')
		let new_mode = mode()

		if g:last_mode == new_mode
			return ''
		endif

		if new_mode == 'i'
			hi User1 guibg=#FFAD57 ctermfg=236 ctermbg=215
			hi User2 guifg=#FFAD57 ctermfg=215 ctermbg=236
		elseif new_mode == 'v' || new_mode == 'V'
			hi User1 guibg=#B16286 ctermfg=236 ctermbg=96
			hi User2 guifg=#B16286 ctermfg=96 ctermbg=236 
		else
			hi User1 guibg=#505050 ctermfg=236 ctermbg=248
			hi User2 guifg=#505050 ctermfg=248 ctermbg=236 
		endif

		let g:last_mode = new_mode
	else
		execute 'hi User1 guibg=' . g:statusline_bg
		execute 'hi User2 guifg=' . g:statusline_fg
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

function s:toggle_overlength()
	if &colorcolumn == 0
		set colorcolumn=80
	else
		set colorcolumn=0
	endif
endfun
command ToggleOverlength call s:toggle_overlength()

let g:indent_guides = 0
function s:toggle_indent_guides()
	if g:indent_guides
		set listchars=tab:\ \ ,trail:·
		let g:indent_guides = 0
	else
		set listchars=tab:\│\ ,trail:·
		let g:indent_guides = 1
	endif
endfun
command ToggleIndentGuides call s:toggle_indent_guides()

function s:syn_group()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
command SyncGroup call s:syn_group()

function s:start_buffer()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif

    " Start a new buffer ...
    enew

    " ... and set some options for it
    setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ noswapfile
        \ norelativenumber

    " Now we can just write to the buffer, whatever you want.
    call append('$', "")
    for line in split(system('fortune -a'), '\n')
        call append('$', '        ' . l:line)
    endfor

    " No modifications to this buffer
    setlocal nomodifiable nomodified

    " When we go to insert mode start a new buffer, and start insert
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

" Run after "doing all the startup stuff"
autocmd VimEnter * call s:start_buffer()
