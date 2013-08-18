" Plugins
" vim-pathogen https://github.com/tpope/vim-pathogen
" vim-endwise  https://github.com/tpope/vim-endwise
" vim-rails    https://github.com/tpope/vim-rails
" vim-fugitive https://github.com/tpope/vim-fugitive
" vim-airline  https://github.com/bling/vim-airline
" nerdtree     https://github.com/scrooloose/nerdtree
" snipmate     https://github.com/msanders/snipmate.vim
" ctrlp.vim    https://github.com/kien/ctrlp.vim
" ack          https://github.com/mileszs/ack.vim

call pathogen#infect()

" Show line numbers
set number

" Tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set shell=/usr/local/bin/zsh

" Indentation
set autoindent
set cindent
set smartindent
set copyindent

" No line wrapping
set nowrap

" Syntax highlighting ftw!
syntax on
if has("autocmd")
  filetype indent on
endif

" Show status bar
set ls=2

" Show title in console title bar
set title

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

" 80 chars per row!
set colorcolumn=81

" Vim7.3 broke my backspace normal behavior (:(
set backspace=indent,eol,start

" Usefull commands
command Q q

" Highlight the current line
set cul

if has("gui_running")
  set background=dark
  colorscheme monokai
  "set guifont=Menlo:h11
  "set guifont=Monaco:h12
  set guifont=Meslo\ LG\ L\ DZ\ Regular\ for\ Powerline:h12
  set guioptions-=T
  set guioptions-=rL
  set transp=2
else
  colorscheme monokai
endif

" Show/Hide NERDTree
map N :NERDTreeToggle<CR>

" Trigger CommandP
map <C-p> :CtrlP<CR>

" Trigger CTags
map <C-t> :TlistToggle<CR>

" Run spec
map <C-s> :! spec %<CR>

" I've got to set this up in order to make sparkup to work
filetype plugin on

" Highlight whitespaces at the end of the lines
set listchars=tab:\|⋅,trail:⋅,nbsp:⋅
set list

" Remove trailing whitespaces
map S :%s/\s\+$//g<CR>:w<CR>

" Replace tabs with spaces
map tt :%s/\t/\ \ /g<CR>:w<CR>

" Remap ESC to Command E
inoremap <D-e> <Esc>

" Remap ESC
inoremap jj <Esc>

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Airline config
"let g:airline_theme='light'
let g:airline_enable_fugitive=1
let g:airline_powerline_fonts=1

set ttimeoutlen=50
