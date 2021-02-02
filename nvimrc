call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'preservim/nerdtree'
call plug#end()

" [ UI ]
syntax enable
set nu
set termguicolors
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" Show a vertical line on column #81 so that we keep things nice and tidy
set colorcolumn=81

" [ Tabs ]
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" [ No backups ]
set nobackup
set nowritebackup
set noswapfile

" Search stuff
" Case insensitive search
set ignorecase
" Case sensitive if including capitals.
set smartcase
" Highlight search matches
set hlsearch
" Incremental search
set incsearch

" [ Key Mappings ]
" Press Spacebar for cleaning highlighted search matches.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Run Terraform formatting on the currently open file
map þ :! terraform fmt %<CR><CR>

" My CapsLock key is remapped to Ctrl and I'm too lazy to go all the way to
" the ESC key, so I remap that to just pressing twice jj
inoremap jj <Esc>

" Toggle NERDTree
map N :NERDTreeToggle<CR>

" Close tab
map <C-k> :q<CR>

" Press ENTER in navigation mode to save the current file.
nnoremap <Enter> :w<CR>

" Telescope mappings
map <C-p> :Telescope find_files<CR>
map <C-g> :Telescope live_grep<CR>

" Set sytanx for tfvars files
autocmd BufNewFile,BufRead *.tfvars set syntax=tf
