let mapleader = ' '

nmap q <nop> " disable macro
nmap <space> <nop>
nmap <expr> j v:count ? 'j' : 'gj'
nmap <expr> k v:count ? 'k' : 'gk'

" Jump
nmap <C-j> }
nnoremap <C-k> {
vmap <C-j> }
vmap <C-k> {

" Save / Exit
nmap <leader>w <cmd>w<cr>
nmap <leader>q <cmd>q<cr>
nmap <leader>x <cmd>x<cr>

" Resize buffer
nmap - <c-w>5<
nmap _ <c-w>5>
nmap + <c-w>5+
nmap * <c-w>5-

" Split Buffer
nmap <silent> <leader>z :vsp<cr>
nmap <silent> <leader>x :split<cr>

" Telescope
nmap fb <cmd>Telescope buffers theme=dropdown sort_lastused=true ignore_current_buffer=true<cr>
nmap ff <cmd>lua require('me.utils').find_git_files()<cr>
nmap fi <cmd>Telescope lsp_document_symbols theme=dropdown<cr>
nmap fp <cmd>lua require('telescope').extensions.project.project{}<cr>

" Harpoon
nmap ss <cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>
nmap sa <cmd>lua require('harpoon.mark').add_file()<cr>
nmap sh <cmd>lua require('harpoon.ui').nav_file(1)<cr>
nmap sj <cmd>lua require('harpoon.ui').nav_file(2)<cr>
nmap sk <cmd>lua require('harpoon.ui').nav_file(3)<cr>
nmap sl <cmd>lua require('harpoon.ui').nav_file(4)<cr>

" Others
nmap F <cmd>Lf<cr>
nmap fd <cmd>Lfcd<cr>
nmap fld <cmd>Lflcd<cr>
nmap <leader>D <cmd>cd %:p:h<cr>
nmap <leader>dl <cmd>cd %:p:h<cr>
nmap <leader>h <cmd>nohlsearch<cr>
vmap <leader>y "+y
vmap <leader>p "+p
vmap r :s///g<left><left><left>
nmap <leader>g gg=G''
nmap <leader>v <cmd>so $MYVIMRC<cr>
nmap ! :!
imap <C-c> <esc><right>
tmap <C-6> <C-w>N<C-6>
tmap <Esc> <C-w>N
nmap <leader>s :%s///g<left><left><left>
nmap <leader>S :s///g<left><left><left>
inoremap <C-l> <delete>
inoremap <C-o> <Esc>o
inoremap <c-d> <Esc>diwi
inoremap <C-delete> <esc><right>dwi
nmap <leader>v viw
nmap <leader>* /<c-r>=expand("<cword>")<CR><CR>N
nmap <leader>i :SyncGroup<cr>

" Insert [], {}, (), '' around line, word or selection
nmap S <nop>
nmap S[ viwc[]<esc>P
nmap S{ viwc{}<esc>P
nmap S( viwc()<esc>P
nmap S" viwc""<esc>P
nmap S' viwc''<esc>P
nmap Sl[ ^vg_c[]<esc>P
nmap Sl{ ^vg_c{}<esc>P
nmap Sl( ^vg_c()<esc>P
nmap Sl" ^vg_c""<esc>P
nmap Sl' ^vg_c''<esc>P
vmap S[ c[]<esc>P
vmap S{ c{}<esc>P
vmap S( c()<esc>P
vmap S" c""<esc>P
vmap S' c''<esc>P
