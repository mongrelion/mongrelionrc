-- LSP
local lsp = require('lspconfig')
local servers = {
  "bashls",
  "pyright",
  "tflint",
  "terraformls",
  "yamlls",
  "ts_ls",
}

for _, server in ipairs(servers) do
  lsp[server].setup{}
end

-- Automatically format terraform files on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})
