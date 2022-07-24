call plug#begin('~/.local/share/nvim/plugged')
" Depencies
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
"Varius
Plug 'ThePrimeagen/harpoon'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'JMcKiern/vim-venter'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascriptreact', 'javascript']}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'amix/open_file_under_cursor.vim'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
" LSP
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
" CMP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
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
set title
set titlestring=%t\ \-\ Vim
set number
set numberwidth=3
set cursorline
set showtabline=1
set winwidth=10
set hidden
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
set listchars=tab:\ \ ,trail:• 
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
set backupdir=~/.local/share/nvim/backup,.
set writebackup
" Splitting
set splitright
set splitbelow
" Auto-completion
set completeopt=menuone,noinsert,preview
"set wildmenu
set wildmode=longest:full,full
" Ruler
set noshowmode
set ruler
set rulerformat=%#LineNr#%{toupper(g:currentmode[mode()])}
set rulerformat+=\ %(\ %M\ %)%(\ %R\ %)%(\ %H\ %)
set rulerformat+=%=≡\ %L:%l
set cmdheight=0
" Statusline
set laststatus=3
set statusline=%#User1#%{IsCurrentWindow()}\ %* 
set statusline+=\ %#User2#%t%*
set statusline+=%=
set statusline+=%{toupper(g:currentmode[mode()])}
set statusline+=%(\ %R%)%(\ %H%)%(\ %M%)
set statusline+=%=
set statusline+=%#StatuslineNc#\ %{fugitive#statusline()}
set statusline+=\ %3*│%#Statusline#\ 
set statusline+=\ %{fnamemodify(getcwd(),':t')}
set statusline+=\ %3*│%#Statusline#\ 
set statusline+=\≡\ %l:%L\ \ 
" nose
set scrolloff=5
set mouse=a
set shortmess+=c
set ttyfast
set clipboard=unnamedplus
" Ignore files
set wildignore+=*.pyc,*.o
set wildignore+=build/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

"
" Let
"
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
let g:venter_disable_vertsplit = v:true
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<C-a>'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_removed = '│'
let g:floaterm_borderchars='─│─│╭╮╯╰'
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_header =[
    \'    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠖⠚⢉⣩⣭⡭⠛⠓⠲⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀  ',
    \'    ⠀⠀⠀⠀⠀⠀⢀⡴⠋⠁⠀⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⢦⡀⠀⠀⠀⠀  ',
    \'    ⠀⠀⠀⠀⢀⡴⠃⢀⡴⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀  ',
    \'    ⠀⠀⠀⠀⡾⠁⣠⠋⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⠀  ',
    \'    ⠀⠀⠀⣸⠁⢰⠃⠀⠀⠀⠈⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀  ',
    \'    ⠀⠀⠀⡇⠀⡾⡀⠀⠀⠀⠀⣀⣹⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀  ',
    \'    ⠀⠀⢸⠃⢀⣇⡈⠀⠀⠀⠀⠀⠀⢀⡑⢄⡀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇  ',
    \'    ⠀⠀⢸⠀⢻⡟⡻⢶⡆⠀⠀⠀⠀⡼⠟⡳⢿⣦⡑⢄⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇  ',
    \'    ⠀⠀⣸⠀⢸⠃⡇⢀⠇⠀⠀⠀⠀⠀⡼⠀⠀⠈⣿⡗⠂⠀⠀⠀⠀⠀⠀⠀⢸⠁  ',
    \'    ⠀⠀⡏⠀⣼⠀⢳⠊⠀⠀⠀⠀⠀⠀⠱⣀⣀⠔⣸⠁⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀  ',
    \'    ⠀⠀⡇⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠃⠀  ',
    \'    ⠀⢸⠃⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⢀⠀⠀⠀⠀⠀⣾⠀⠀  ',
    \'    ⠀⣸⠀⠀⠹⡄⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠸⠀⠀⠀⠀⠀⡇⠀⠀  ',
    \'    ⠀⡏⠀⠀⠀⠙⣆⠀⠀⠀⠀⠀⠀⠀⢀⣠⢶⡇⠀⠀⢰⡀⠀⠀⠀⠀⠀⡇⠀⠀  ',
    \'    ⢰⠇⡄⠀⠀⠀⡿⢣⣀⣀⣀⡤⠴⡞⠉⠀⢸⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⣧⠀⠀  ',
    \'    ⣸⠀⡇⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⢹⠀⠀⢸⠀⠀⢀⣿⠇⠀⠀⠀⠁⠀⢸⠀⠀  ',
    \'    ⣿⠀⡇⠀⠀⠀⠀⠀⢀⡤⠤⠶⠶⠾⠤⠄⢸⠀⡀⠸⣿⣀⠀⠀⠀⠀⠀⠈⣇⠀  ',
    \'    ⡇⠀⡇⠀⠀⡀⠀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠸⡌⣵⡀⢳⡇⠀⠀⠀⠀⠀⠀⢹⡀  ',
    \'    ⡇⠀⠇⠀⠀⡇⡸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠮⢧⣀⣻⢂⠀⠀⠀⠀⠀⠀⢧  ',
    \'    ⣇⠀⢠⠀⠀⢳⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡎⣆⠀⠀⠀⠀⠀⠘  ',
    \]
let g:dashboard_custom_shortcut_icon = {}
let g:lf_replace_netrw = 1
" Disable built-in plugins
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1

let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_2html_plugin = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
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
	autocmd VimEnter * call setwinvar(winnr(), 'curr', 1)
augroup end

augroup Others
	autocmd FileType js let b:vimpipe_command="node"
	autocmd BufRead,BufNewFile *.ol set filetype=olmos
	autocmd filetype html setlocal foldmethod=indent
augroup end 

"
" Resources
"
source ~/.config/nvim/functions.vim
source ~/.config/nvim/keymaps.vim
luafile ~/.config/nvim/lua/me/init.lua

"
" Highlight
"
hi User1 guifg=#228ae7 guibg=#000000 ctermfg=236 ctermbg=236 
execute 'hi User2 guifg=#228ae7 guibg=' . g:statusline_bg
execute 'hi User3 guifg=#353535 guibg=' . g:statusline_bg
hi GitGutterAdd    guifg=#009900 ctermfg=2
hi GitGutterChange guifg=#bbbb00 ctermfg=3
hi GitGutterDelete guifg=#ff2222 ctermfg=1
hi FloatermBorder guibg=none guifg=#505050
hi Pmenu guibg=none
hi CmpBorder guibg=none guifg=#404040
hi FloatBorder guifg=#635644
