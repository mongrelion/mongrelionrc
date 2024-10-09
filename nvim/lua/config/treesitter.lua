-- TreeSitter
require('nvim-treesitter.configs').setup {
  sync_install = true,

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },

  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "go",
    "hcl",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "terraform",
    "toml",
    "yaml",
    "vim"
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "<C-j>",
      node_decremental = "<C-k>",
      scope_incremental = "grc",
    },
  },
}
