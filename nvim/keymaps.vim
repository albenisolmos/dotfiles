let mapleader = ' '

nmap q <nop>
nmap <space> <nop>
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

nmap <C-j> }
vmap <C-j> }
vmap <C-k> {
nnoremap <C-k> {

" Save / Exit
nnoremap <silent> <leader>w :w<cr>
nmap <silent> <leader>q :q<cr>
nmap <silent> <leader>x :x<cr>

" Resize buffer
nmap - <c-w>5<
nmap _ <c-w>5>
nmap + <c-w>5+
nmap * <c-w>5-
" Split Buffer
nmap <silent> <leader>z :vsp<cr>
nmap <silent> <leader>x :split<cr>
" Harpoon
nmap <leader>m <cmd>lua require("harpoon.mark").add_file()<cr>
nmap <leader>M <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
" Telescope
"nmap F <cmd>Telescope file_browser<cr>
nmap ff <cmd>Telescope find_files theme=dropdown<cr>
nmap B <cmd>Telescope buffers theme=dropdown sort_lastused=true ignore_current_buffer=true<cr>
nmap fp <cmd>lua require('utils').telescope_project_search()<cr>
nmap fi <cmd>Telescope lsp_document_symbols theme=dropdown<cr>
" LF
nmap F <cmd>Lf<cr>
" Toggle
nmap <silent> <leader>W :WriterMode<cr>
nmap <silent> <leader>h :nohlsearch<cr>
" Varius
inoremap <C-o> <Esc>o
nmap vv viw
vmap <leader>y "+y
vmap <leader>p "+p
nmap <leader>g gg=G''
inoremap <c-d> <Esc>diwi
vmap <leader>r :s////g<left><left><backspace><left>
nmap <silent> <leader>v :so $MYVIMRC<cr>
nmap ! :!
tmap <C-6> <C-w>N<C-6>
tmap <Esc> <C-w>N
nmap <leader>s :%s///g<LEFT><LEFT>
nmap <leader>S :s///g<LEFT><LEFT>
inoremap <C-delete> <esc><right>dwi
nmap <leader>* /<c-r>=expand("<cword>")<CR><CR>N

nmap <leader>i :call SynGroup()<cr>

" Insert around word
nmap S <nop>
nmap Sw[ viwc[]<esc>P
nmap Sw{ viwc{}<esc>P
nmap Sw( viwc()<esc>P
nmap Sw" viwc""<esc>P
nmap Sw' viwc''<esc>P
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
