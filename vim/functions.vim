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

function! s:on_init_vim()
	if argc() == 0
		cnoremap <silent> q<CR> :call <SID>on_quit(0)<CR>
		let s:no_arguments = 1
	endif

	if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
		return
	endif

	call s:start_page()
endfun
autocmd VimEnter * call s:on_init_vim()

function! s:on_quit(writeFile)
	if a:writeFile
		if (expand('%:t')=="")
			echo "Can't save a file with no name."
			return
		endif
		:write
	endif

	if (winnr('$')==1 && tabpagenr('$')==1)
		call s:start_page()
	else
		:quit
	endif
endfun

function s:set_bufhidden()
	if &ft != 'netrw'
		set bufhidden=hide
	endif
endfun
augroup Netrw
    autocmd!
    autocmd BufWinEnter * call s:set_bufhidden()
augroup end

fun! s:set_hi(group, fg, bg)
	if a:fg != '' 
		execute 'hi ' . a:group . ' guifg=' . a:fg
	endif
	if a:bg != ''
		execute 'hi ' . a:group . ' guibg=' . a:bg 
	endif
endfun

function! WriterMode()
	if getwinvar(winnr(), '&number') == '0'
		setlocal number
		set showbreak=↳\  
	else
		setlocal nonumber
		set showbreak=
	endif
endfun
command WriterMode call WriterMode()

function! IsCurrentWindow()
	if getwinvar(winnr(), 'curr')
		let newmode = mode()
		if newmode == 'i'
			hi User1 ctermfg=236 ctermbg=215
			hi User1 ctermfg=215 ctermbg=236
			call s:set_hi('User1', '', '#FFAD57')
			call s:set_hi('User2', '#FFAD57', '')
		elseif newmode == 'v' || newmode == 'V' 
			hi User1 ctermfg=236 ctermbg=96
			hi User2 ctermfg=96 ctermbg=236 
			call s:set_hi('User1', '', '#B16286')
			call s:set_hi('User2', '#B16286', '')
		else
			hi User1 ctermfg=236 ctermbg=248
			hi User2 ctermfg=248 ctermbg=236 
			call s:set_hi('User1', '', '#505050')
			call s:set_hi('User2', '#505050', '')
		endif
	else
		hi User1 ctermfg=248 ctermbg=236
		hi User2 ctermfg=240 ctermbg=236 
		call s:set_hi('User1', '', g:olmos_statusline_bg)
		call s:set_hi('User2', g:olmos_statusline_fg, '')
	endif

	return ''
endfun

function! s:on_enter_netrw()
	nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
	nmap <buffer> h -
	nmap <buffer> l <Return>
	nmap <buffer> <leader>H u
	nmap <buffer> t -^
	" Mark
	nmap <buffer> <TAB> mf " Mark file
	nmap <buffer> <S-TAB> mF " Unmark file
	nmap <buffer> <Leader><TAB> " Unmark all files
	" Actions
	nmap <buffer> ff %:w<cr>:buffer #<cr> 
	nmap <buffer> fF %:w<cr>:buffer #<cr> " Create and enter
	nmap <buffer> fr R " Rename
	nmap <buffer> fc mc " Copy in target
	nmap <buffer> fC mtmc " idk
	nmap <buffer> fx mm " Move in target
	nmap <buffer> fX mtmm " idk
	" Bookmarks
	nmap <buffer> bb mb " Make BM
	nmap <buffer> bd mB " Delete BM
	nmap <buffer> bl gb " Go last BM

	setlocal list
	setlocal statusline=\ %#User2#%{fnamemodify(getcwd(),':t')}%*
	setlocal statusline+=%=
	setlocal statusline+=%L:%l\ 
endfun
autocmd filetype netrw call s:on_enter_netrw()

function! ToggleExplore(side)
	if a:side == 'fill'
		if getwinvar(winnr(), '&filetype') !=  'netrw'
			let g:netrw_liststyle = 4
			exe 'Explore'
			call setwinvar(winnr(), 'fill', 1)
			let g:netrw_liststyle = 3
		elseif getwinvar(winnr(), 'fill')
			silent exe 'Rexplore'
		endif
		return
	endif

	let there_netrw = 0

	for i in range(1, bufnr('$'))
		if getbufvar(i, '&filetype') == "netrw" && !getbufvar(i, 'fill')
			silent exe 'bwipeout ' . i
			let there_netrw = 1
		endif
	endfor

	if there_netrw == 0
		if a:side == 'left'
			exe 'Lexplore'
		elseif a:side == 'right'
			exe 'Lexplore!'
		endif
	endif
endfun
nmap <silent> <S-f> :call ToggleExplore('fill')<CR>
nmap <silent> <leader>e :call ToggleExplore('left')<CR>
nmap <silent> <leader>r :call ToggleExplore('right')<CR>

function! RunFunc(...)
	if a:0 == 0
		let file = 'a.out'
	else
		let file = a:000[0]
	endif
	execute '!clear; ./' . file
endfun

function! OnEnter()
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
imap <expr> <CR> OnEnter()

function! s:ToggleStatusline()
	if &laststatus == 0 || &laststatus == 1
		set laststatus=2
		set noshowmode
	else
		set laststatus=0
		set showmode
	endif
endfun
command ToggleStatusline call s:ToggleStatusline()

function! s:centerText(str)
	return repeat(' ', (&columns - len(a:str))/2) . a:str
endfun

function! s:getCenterCoord(str)
	return (&columns - len(a:str))/2
endfun
let longest_length_line = 0
function s:appendOption(prefix, str, suffix)
	let line = prefix . str
	let length = strlen(a:str)

	if length > longest_length_line
		longest_length_line = length
	endif

	call append('$', s:centerText("New File    [n]"))
endfun

function! s:start_page()
	enew
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

	call append('$', s:centerText("New File    [n]"))
	call append('$', s:centerText("Browse file [f]"))
	call append('$', s:centerText("Exit        [q]"))
	"call append('$', s:white_spaces . g:text_startpage)
	"    for line in split(system('fortune -a | cowsay -f daemon'), '\n')
	"        call append('$', '        ' . l:line)
	"    endfor
	setlocal nomodifiable nomodified
	nnoremap <buffer><silent> n :enew <bar> startinsert<CR>
	nnoremap <buffer><silent> f :call ToggleExplore('fill')<CR>
	nnoremap <buffer><silent> q :qa<cr>
endfun

"| ¦ ┆ │
" e <f> | epen a file
" b <f> | open a opened file
" bn | where n is number open a n'th file 
" tabe <b>
"
"autocmd TextChangedI,TextChangedP * call s:on_complete_check()
