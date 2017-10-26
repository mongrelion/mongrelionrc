set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/snipMate'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'croaker/mustang-vim'
Plugin 'tomasr/molokai'
Plugin 'hashivim/vim-terraform'
Plugin 'cespare/vim-toml'

let g:molokai_original = 1

call vundle#end()

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Show line numbers
set number

" Tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Indentation
filetype plugin indent on
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
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Start scrolling 9 lines before edge of viewport
set scrolloff=9

" Search stuff
" Case insensitive search
set ignorecase
" Case sensitive if including capitals.
set smartcase
" Highlight search matches
set hlsearch
" Incremental search
set incsearch

" Press Spacebar for cleaning highlighted search matches.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Press ENTER in navigation mode to save the current file.
nnoremap <Enter> :w<CR>

" No backups
set nobackup
set nowritebackup
set noswapfile

" Colorscheme
colo molokai

" Trigger CommandP
map <C-p> :CtrlP<CR>

" Close tab
map <C-k> :q<CR>

" Highlight whitespaces at the end of the lines
set listchars=tab:\|⋅,trail:⋅,nbsp:⋅
set list

" Remove trailing whitespaces
map S :%s/\s\+$//g<CR>:w<CR>

" Replace tabs with spaces
map tt :%s/\t/\ \ /g<CR>:w<CR>

" Remap ESC
inoremap jj <Esc>

" Tabs instead of spaces for Go.
au FileType go setl tabstop=2 noexpandtab shiftwidth=2 softtabstop=2
au FileType c setl tabstop=2 shiftwidth=2 softtabstop=2

" Hide scrollbars
if has("gui_running")
  set go-=rL
endif

" Toggle NERDTree
map N :NERDTreeToggle<CR>

" Ignore build/
set wildignore+=*/build/*

" Folding
"set fdm=syntax

" Have CtrlP use ag instead of grep
if executable('ag')
  let g:ctrlp_user_command = 'ag %s --files-with-matches --hidden --ignore .git/ --nocolor -g ""'
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_show_hidden = 1
endif

" Macro to replace tabs for double spaces
