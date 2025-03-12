require('config.treesitter')
require('config.lsp')
require('config.telescope')

-- Any configuration that doesn't deserve its own config file goes here
require('mason').setup()
require('Comment').setup()
require("CopilotChat").setup()
