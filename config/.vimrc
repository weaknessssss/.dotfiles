syntax on
set number
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab

set cursorline

vmap <C-c> "+y

set clipboard=unnamedplus

set ignorecase
set smartcase

set incsearch
set hlsearch

set clipboard=unnamedplus
highlight LineNr guifg=#878580
highlight CursorLineNr guifg=#ce5d97

set scrolloff=16           
set wildmenu              
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

