" Plugins
" vim-pathogen    https://github.com/tpope/vim-pathogen
" vim-endwise     https://github.com/tpope/vim-endwise
" vim-rails       https://github.com/tpope/vim-rails
" vim-fugitive    https://github.com/tpope/vim-fugitive
" vim-cucumber    https://github.com/tpope/vim-cucumber
" vim-surround    https://github.com/tpope/vim-surround
" nerdtree        https://github.com/scrooloose/nerdtree
" snipmate        https://github.com/msanders/snipmate.vim
" commandt        https://github.com/wincent/Command-T
" vim-easymotion  https://github.com/Lokaltog/vim-easymotion
" sparkup         https://github.com/rstacruz/sparkup
" ack             https://github.com/mileszs/ack.vim
" tabular         https://github.com/godlygeek/tabular

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

" Customize status bar
set stl=%m\ %f\ %=%l,%P\ %y

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
set colorcolumn=80

" Vim7.3 broke my backspace normal behavior (:(
set backspace=indent,eol,start

" Usefull commands
command Q q

" Highlight the current line
set cul

if has("gui_macvim")
  colorscheme solarized
  set background=dark
  set guifont=VT220:h20
  set guioptions-=T
  set guioptions-=rL
endif

" Show/Hide NERDTree
map N :NERDTreeToggle<CR>

" Trigger CommandT
map T :CommandT<CR>

" I've got to set this up in order to make sparkup to work
filetype plugin on

" Highlight whitespaces at the end of the lines
set listchars=tab:\|⋅,trail:⋅,nbsp:⋅
set list

" Remove trailing whitespaces
map <C-s> :%s/\s\+$//g

" Replace tabs with spaces
map <C-t> :%s/\t/\ \ /g

" Remap ESC to Command E
inoremap <D-e> <Esc>

" Remap ESC
inoremap jj <Esc>
vnoremap ; <Esc>
cnoremap ; <Esc>
