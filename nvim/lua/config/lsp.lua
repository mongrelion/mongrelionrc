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
