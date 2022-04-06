call plug#begin('~/.vim/plugged')
" Local
Plug '~/Dev/vim-plugins/lets-start'
Plug '~/Dev/vim-plugins/nvim-tree-config'
" Depencies
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
"Varius
Plug 'JMcKiern/vim-venter'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript']}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'amix/open_file_under_cursor.vim'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'ThePrimeagen/harpoon'
" Schemes
Plug 'lifepillar/vim-gruvbox8'
Plug 'sainnhe/gruvbox-material'
" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
" LSP
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
" CMP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Snip
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
call plug#end()

set termguicolors
set bg=dark
colorscheme olimpo 
syntax on
set lazyredraw
set autochdir
set title
set titlestring=%t\ \-\ Vim
set number
set numberwidth=3
set cursorline
set showtabline=1
set winwidth=10
set nohidden
" Tabs & Spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
" Text
set linespace=4
set autoindent
set wrap
set linebreak
set breakindent
set showbreak=↳\ 
set list
set listchars=tab:\│\ ,trail:· 
set fillchars+=vert:\│ 
" Fold
set foldmethod=syntax
set nofoldenable
set foldlevel=1
set fillchars+=fold:\ 
" Seaching + Regex
set incsearch
set hlsearch
" Backup & Undo
set swapfile
set backup
set backupdir=~/.config/nvim/backup//
set writebackup
" Splitting
set splitright
set splitbelow
" Auto-completion
set completeopt=menuone,noinsert,longest,preview
set wildignore+=**/node_modules/**
set wildmode=longest:full,full
" Status Bar
set noshowmode
set ruler
set rulerformat=%#LineNr#%{toupper(g:currentmode[mode()])}
set rulerformat+=\ %(\ %M\ %)%(\ %R\ %)%(\ %H\ %)
set rulerformat+=%=≡\ %L:%l
set laststatus=2
set statusline=%#User1#%{IsCurrentWindow()}\ %* 
set statusline+=\ %#User2#%t%*
set statusline+=%=
set statusline+=%#StatuslineNc#\ %{fugitive#statusline()}
set statusline+=\ %3*│%#StatuslineNc#\ %{fnamemodify(getcwd(),':t')}\ %3*│%#StatuslineNc#
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%(\ %R%)%(\ %H%)
set statusline+=\ %3*│%#StatuslineNc#\ %p%%\ \≡\ %L:%l\ 
" nose
set scrolloff=5
set mouse=a
set shortmess+=c
set belloff+=ctrlg
set ttyfast
set wildmenu
set clipboard=unnamedplus

if !has('nvim')
	set ttymouse=xterm2
endif

"
" Let
"

" Shape of cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
let g:venter_disable_vertsplit = v:true
" Vim JS Template
let g:htl_css_templates = 1
let g:htl_all_templates = 1
" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<C-a>'
" Ale
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
" Gitgutter
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_removed = '│'
let g:lets_start_cmd_file_explorer = 'NvimTreeVinegar'
let g:nvim_tree_icons = {
	\ 'default': '',
	\ 'symlink': '',
	\ 'git': {
		\ 'unstaged': "✗",
		\ 'staged': "✓",
		\ 'unmerged': "",
		\ 'renamed': "➜",
		\ 'untracked': "★",
		\ 'deleted': "",
		\ 'ignored': "◌"
		\ },
	\ 'folder': {
		\ 'arrow_open': "",
		\ 'arrow_closed': "",
		\ 'default': "",
		\ 'open': "",
		\ 'empty': "",
		\ 'empty_open': "",
		\ 'symlink': "",
		\ 'symlink_open': ""
	\ }
\ }

"
" Highlight
"
hi User1 guifg=#228ae7 guibg=#000000 ctermfg=236 ctermbg=236 
execute 'hi User2 guifg=#228ae7 guibg=' . g:olmos_statusline_bg
execute 'hi User3 guifg=#353535 guibg=' . g:olmos_statusline_bg
hi GitGutterAdd    guifg=#009900 ctermfg=2
hi GitGutterChange guifg=#bbbb00 ctermfg=3
hi GitGutterDelete guifg=#ff2222 ctermfg=1
"
" Commands
"
command Q :q
command W :w
"
" AutoCMD
"
augroup FancyStatusline
	autocmd WinLeave * call setwinvar(winnr(), 'curr', 0)
	autocmd WinEnter * call setwinvar(winnr(), 'curr', 1)
augroup end

augroup Others
	autocmd FileType js let b:vimpipe_command="node"
	autocmd BufRead,BufNewFile *.ol set filetype=olmos
	autocmd filetype html setlocal foldmethod=indent
	autocmd! VimEnter * if isdirectory(expand('%:p')) | exe 'cd %:p:h' | exe 'bd!'| exe 'Telescope file_browser' | endif
augroup end 

" Other
source ~/.vim/maps.vim
source ~/.vim/functions.vim
luafile ~/.vim/lua/init.lua
