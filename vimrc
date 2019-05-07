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
Plug 'haya14busa/incsearch.vim'
    " map /  <Plug>(incsearch-forward)
    "     " map ?  <Plug>(incsearch-backward)
    "         " map g/ <Plug>(incsearch-stay)
    "
Plug 'easymotion/vim-easymotion'
    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)
    " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)
    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)
    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)
    " You can use other keymappings like <C-l> instead of <CR> if you want to
    " use these mappings as default search and sometimes want to move cursor with
    " EasyMotion.
    function! s:incsearch_config(...) abort
      return incsearch#util#deepextend(deepcopy({
      \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
      \   'keymap': {
      \     "\<CR>": '<Over>(easymotion)'
      \   },
      \   'is_expr': 0
      \ }), get(a:, 1, {}))
    endfunction

    noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
    noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
    noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
    map z/ <Plug>(incsearch-easymotion-/)
    map z? <Plug>(incsearch-easymotion-?)
    map zg/ <Plug>(incsearch-easymotion-stay)
    " incsearch.vim x fuzzy x vim-easymotion
    function! s:config_easyfuzzymotion(...) abort
      return extend(copy({
      \   'converters': [incsearch#config#fuzzy#converter()],
      \   'modules': [incsearch#config#easymotion#module()],
      \   'keymap': {"\<CR>": '<Over>(easymotion)'},
      \   'is_expr': 0,
      \   'is_stay': 1
      \ }), get(a:, 1, {}))
    endfunction
    noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
" ---
" Initialize plugin system
call plug#end()
