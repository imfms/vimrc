set nocompatible
filetype plugin on
runtime macros/matchit.vim

set number

set incsearch
set hlsearch

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

