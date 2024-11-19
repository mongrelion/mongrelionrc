-- [ Key Mappings ]
-- Leader key /o\
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local builtin = require('telescope.builtin')

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

-- Make currently open file executable
map('', '<Leader>mx', ':! chmod +x %<CR><CR>', {})

-- Launch lazygit
map('', '<Leader>lg', ':LazyGit<CR>', {})

-- AI assistant key bindings
vim.keymap.set('v', '<leader>a', ':Gen <CR>', {})
vim.keymap.set('n', '<leader>a', ':Gen <CR>', {})

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
