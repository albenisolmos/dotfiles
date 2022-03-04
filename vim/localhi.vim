" Background colors for terminal windows
hi ActiveTerminal guibg=#333333

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of terminal window
function! Handle_Win_Enter()
  if &buftype ==# 'terminal'
    setlocal winhighlight=Normal:ActiveTerminal
  endif
endfun
