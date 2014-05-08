"set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Show line numbers
set number

" Tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Indentation
set autoindent
set cindent
set smartindent
set copyindent

" Full support for Backspace in Insert mode
set backspace=2

" No line wrapping
set nowrap

" Syntax highlighting ftw!
syntax on

" Use new regexp engine for ruby in ViM 7.4
set re=1

" Status bar
set ls=2

" Search stuff
" Case insensitive search
set ignorecase
" Highlight search matches
set hlsearch
" Incremental search
set incsearch

" Press Spacebar for cleaning highlighted search matches.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" No backups
set nobackup
set nowritebackup
set noswapfile

" Colorscheme
colo mustang

" Trigger CommandP
map <C-p> :CtrlP<CR>

" Highlight whitespaces at the end of the lines
set listchars=tab:\|⋅,trail:⋅,nbsp:⋅
set list

" Remove trailing whitespaces
map S :%s/\s\+$//g<CR>:w<CR>

" Replace tabs with spaces
map tt :%s/\t/\ \ /g<CR>:w<CR>

" Remap ESC
inoremap jj <Esc>
