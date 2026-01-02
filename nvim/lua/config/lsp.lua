-- LSP
local servers = {
  "bashls",
  "pyright",
  "tflint",
  "terraformls",
  "yamlls",
  "gopls",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

-- Automatically format terraform files on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})
