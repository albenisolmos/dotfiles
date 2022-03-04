let mapleader = ' '

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
nmap <leader>< 10<c-w><
nmap <leader>> 10<c-w>>
nmap - 10<c-w><
nmap _ 10<c-w>>

" Split Buffer
nmap <silent> <leader>z :vsp<cr>
nmap <silent> <leader>x :split<cr>

" Toggle
nmap <silent> <leader>b :ToggleBufExplorer<cr>
nmap <silent> <leader>W :WriterMode<cr>
nmap <silent> <leader>l :TagbarToggle<cr>
nmap <silent> <leader>h :nohlsearch<cr>
" Varius
inoremap <C-o> <Esc>o
nmap B viw
vmap <leader>y "+y
vmap <leader>p "+p
nmap <leader>g gg=G''
inoremap <c-d> <Esc>diwi
nnoremap <leader>B :buffers<cr>:buffer<space> 
vmap <leader>r :s////g<left><left><backspace><left>
nmap <silent> <leader>v :so $MYVIMRC<cr>
nmap ! :!
tmap <C-6> <C-w>N<C-6>
tmap <Esc> <C-w>N
nmap <leader>S :%s//g<LEFT><LEFT>
nmap <leader>s :s//g<LEFT><LEFT>
inoremap <C-delete> <esc><right>dwi

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

nmap <leader>ld :lua vim.diagnostic.disable()<cr>
