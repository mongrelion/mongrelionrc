call plug#begin('~/.local/share/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'kdheepak/lazygit.nvim'
Plug 'williamboman/mason.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'tpope/vim-fugitive'

" themes
Plug 'ghifarit53/tokyonight-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'David-Kunz/gen.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'github/copilot.vim'
Plug 'numToStr/Comment.nvim'
call plug#end()

lua <<EOF
require("globals")
require("keybindings")
require("config")
EOF

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Setting colorscheme options from lua is giving odd behaviour.
" When nvim starts, the colors are off from the actual colorscheme but calling
" :colorscheme tokyonight again fixes the issue.
" By moving the setting out of lua and into vimscript, the issue is gone :(
" So porting this to lua is going to take a little more investigation.
set termguicolors
" let g:tokyonight_style = 'storm'
" let g:tokyonight_enable_italic = 1
" colorscheme tokyonight
"colorscheme nord
"highlight Normal guibg=none
"set bg=dark
"highlight NonText guibg=none
colorscheme dracula

" No backups
" TODO: Fix. Options not available in nvim lua
set nobackup
set nowritebackup
set noswapfile

set rtp+=/usr/local/opt/fzf
