set history=1000

set wildmenu
set wildmode=list:full

set number
set incsearch
set hlsearch

set nowrap

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" ---
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
" ---
" Initialize plugin system
call plug#end()
