" Plugins
" vim-pathogen  https://github.com/tpope/vim-pathogen
" vim-endwise   https://github.com/tpope/vim-endwise
" vim-rails     https://github.com/tpope/vim-rails
" vim-fugitive  https://github.com/tpope/vim-fugitive
" vim-cucumber  https://github.com/tpope/vim-cucumber
" vim-surround  https://github.com/tpope/vim-surround
" nerdtree      https://github.com/scrooloose/nerdtree
" snipmate      https://github.com/msanders/snipmate.vim
" commandt      https://github.com/wincent/Command-T

call pathogen#infect()

" Show line numbers
set number

" Tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set shell=/bin/zsh

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
set colorcolumn=80

" Vim7.3 broke my backspace normal behavior (:(
set backspace=indent,eol,start

" Alt + ->/<- to move tabs \o/
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" Usefull commands
command Q q

" Highlight the current line
set cul

if has( "gui_macvim" )
  colorscheme mustang
  set guifont=Monaco:h12
  set guioptions-=T
  set guioptions-=rL
endif

" Show/Hide NERDTree
map <F2> :NERDTreeToggle<CR>

" Trigger CommandT
map <silent> <C-t> :CommandT<CR>
