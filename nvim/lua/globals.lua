-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Set syntax for terraform state files
vim.cmd('autocmd BufNewFile,BufRead *.tfstate set syntax=json')

-- Set sytanx for kube config file
vim.cmd('autocmd BufNewFile,BufRead ~/.kube/config set syntax=yaml')

local set = vim.opt

-- Show a vertical line on column #160 so that we keep things nice and tidy
set.colorcolumn = '160'

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
set.nu = true

-- When opening a vertical split, open it to the right
set.splitright = true

set.backup = false
set.writebackup = false
set.swapfile = false
