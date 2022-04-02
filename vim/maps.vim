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
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fF <cmd>lua require('utils').telescope_project_search()<cr>
nnoremap B <cmd>Telescope buffers<cr>
nnoremap tp <cmd>lua require('telescope').extensions.project.project({})<cr>
" Toggle
nmap <silent> <leader>f :NvimTreeCToggle<cr>
nmap <silent> F :Telescope file_browser<cr>
nmap <silent> <leader>W :WriterMode<cr>
nmap <silent> <leader>h :nohlsearch<cr>
" Varius
inoremap <C-o> <Esc>o
nmap vg viw
vmap <leader>y "+y
vmap <leader>p "+p
nmap <leader>g gg=G''
inoremap <c-d> <Esc>diwi
vmap <leader>r :s////g<left><left><backspace><left>
nmap <silent> <leader>v :so $MYVIMRC<cr>
nmap ! :!
tmap <C-6> <C-w>N<C-6>
tmap <Esc> <C-w>N
nmap <leader>S :%s//g<LEFT><LEFT>
nmap <leader>s :s//g<LEFT><LEFT>
inoremap <C-delete> <esc><right>dwi
nmap <leader>* /<c-r>=expand("<cword>")<CR><CR>N

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
