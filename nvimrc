call plug#begin('~/.local/share/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'kdheepak/lazygit.nvim'
Plug 'williamboman/mason.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

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
local set = vim.opt
-- Show a vertical line on column #81 so that we keep things nice and tidy
set.colorcolumn = '81'

-- Tabs
set.expandtab = true
set.shiftwidth = 2
set.softtabstop = 2
set.tabstop = 2

-- Anything you copy
-- set.clipboard = set.clipboard + 'unnamedplus'
set.clipboard = 'unnamedplus'

-- Search stuff
-- Case insensitive search
set.ignorecase = true

-- Case sensitive if including capitals.
set.smartcase = true

-- Highlight search matches
set.hlsearch = true
-- Incremental search
set.incsearch = true

-- UI
vim.cmd('syntax enable')
set.nu = true

-- [ Key Mappings ]
-- Leader key /o\
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap

-- C-v doesn't work great in Windows / Terminal, so we remap it to <Leader>v
map('n', '<Leader>v', '<C-v>', {noremap = true})

-- Press enter in normal mode to save the current file.
map('n', '<Enter>', ':w<CR>', {noremap = true})

-- Press Spacebar for cleaning highlighted search matches.
map('n', '<Leader><Space>', ':nohlsearch<Bar>:echo<CR>', {noremap = true})

-- nvim-tree
map('', '<Leader>n', ':Neotree toggle<CR>', {})

-- My CapsLock key is remapped to Ctrl and I'm too lazy to go all the way to
-- the ESC key, so I remap that to just pressing twice jj
map('i', 'jj', '<Esc>', {noremap = true})

-- Close tab
map('', '<C-k>', ':q<CR>', {})

-- Press ENTER in navigation mode to save the current file.
map('n', '<Enter>', ':w<CR>', {noremap = true})

-- Make currently open file executable
map('', '<Leader>mx', ':! chmod +x %<CR><CR>', {})

-- Launch lazygit
map('', '<Leader>lg', ':LazyGit<CR>', {})

-- TreeSitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {"python", "json", "bash", "lua", "dockerfile", "go", "hcl", "html", "javascript", "css", "toml", "yaml", "vim"},
  sync_install = true,
  highlight = {
    enable = true,
  },
}

-- Key bindings
local builtin = require('telescope.builtin')

-- Search
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>G', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

-- LSP & TreeSitter
vim.keymap.set('n', '<leader>R', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>d', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>i', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>s', builtin.treesitter, {})

-- Telescope other configs
require("telescope").load_extension("ui-select")
require("telescope").setup {
  pickers = {
    colorscheme = {
      enable_preview = true,
      theme = "dropdown",
      prompt_title = "Colorschemes",
      results_title = false,
      previewer = false,
      layout_config = {
        width = 0.2,
        height = 0.5,
      },
    },
  }
}

-- AI assistant key bindings
vim.keymap.set('v', '<leader>a', ':Gen <CR>', {})
vim.keymap.set('n', '<leader>a', ':Gen <CR>', {})

-- Set sytanx for terraform state files
vim.cmd('autocmd BufNewFile,BufRead *.tfstate set syntax=json')

-- Set sytanx for kube config file
vim.cmd('autocmd BufNewFile,BufRead ~/.kube/config set syntax=yaml')

local lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('i', '<C-Tab>', '<Cmd>lua vim.lsp.buf.completion()<CR>', opts)
  --buf_set_keymap('n', '<space>h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --buf_set_keymap('n', '<space>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

lsp["tflint"].setup{}

lsp["terraformls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

lsp["pyright"].setup {}

lsp["yamlls"].setup {}

lsp["bashls"].setup {}

--  lsp["yamlls"].setup {
--    cmd = { yamllsbin, '--stdio' },
--    on_attach = on_attach
--  }

require("mason").setup()
require('Comment').setup()
EOF

" Run Terraform formatting on the currently open file

" Set sytanx for terraform files
function SetTfOptions()
  set filetype=terraform
  set syntax=tf
endfunction
autocmd BufNewFile,BufRead *.tf,*.tfvars call SetTfOptions()

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
