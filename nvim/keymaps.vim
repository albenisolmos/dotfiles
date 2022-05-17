let mapleader = ' '

nmap q <nop> " disable macro
nmap <space> <nop>
"nnoremap <expr> j v:count ? 'j' : 'gj'
"nnoremap <expr> k v:count ? 'k' : 'gk'

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
nmap ff <cmd>Telescope find_files theme=dropdown<cr>
nmap fb <cmd>Telescope buffers theme=dropdown sort_lastused=true ignore_current_buffer=true<cr>
nmap fp <cmd>lua require('utils').telescope_project_search()<cr>
nmap fi <cmd>Telescope lsp_document_symbols theme=dropdown<cr>

" Harpoon
nmap ss <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
nmap sa <cmd>lua require("harpoon.mark").add_file()<cr>
nmap sh> <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nmap sj> <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nmap sk> <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nmap sl> <cmd>lua require("harpoon.ui").nav_file(4)<CR>
for i in [1,2,3,4,5,6,7,8,9]
	execute printf('nmap s%d <cmd>lua require("harpoon.ui").nav_file(%d)<cr>', i, i)
endfor

" Others
nmap F <cmd>Lf<cr>
nmap <leader>h <cmd>nohlsearch<cr>
vmap <leader>y "+y
vmap <leader>p "+p
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
nmap vv viw
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
