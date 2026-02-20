syntax on
set number
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab

set cursorline

set clipboard=unnamedplus

" Игнорировать регистр при поиске, если нет заглавных букв
set ignorecase
set smartcase

" Показывать совпадения поиска сразу при наборе
set incsearch
set hlsearch

set clipboard=unnamedplus
highlight LineNr guifg=#878580
highlight CursorLineNr guifg=#ce5d97

set scrolloff=16           " Курсор всегда в центре
set wildmenu              " Умное меню команд
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

