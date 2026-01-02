local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('neovim/nvim-lspconfig')
Plug('kdheepak/lazygit.nvim')
Plug('williamboman/mason.nvim')
Plug('MunifTanjim/nui.nvim')
Plug('nvim-neo-tree/neo-tree.nvim')
Plug('tpope/vim-fugitive')

-- themes
Plug('ghifarit53/tokyonight-vim')
Plug('arcticicestudio/nord-vim')
Plug('dracula/vim', { ['as'] = 'dracula' })

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-telescope/telescope-ui-select.nvim')
Plug('David-Kunz/gen.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug('numToStr/Comment.nvim')

-- Github Copilot
Plug('github/copilot.vim')
Plug('CopilotC-Nvim/CopilotChat.nvim')

vim.call('plug#end')

-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
vim.cmd('silent! colorscheme dracula')

require("globals")
require("config")
require("keybindings")
