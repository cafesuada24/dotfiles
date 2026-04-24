vim.lsp.enable({
  'bashls',
  'clangd',
  'lua_ls',
  'pyright',
  'ruff',
  'terraformls',
  'tflint',
  'ts_ls'
})

if vim.g.lsp_on_demands then
  vim.lsp.enable(vim.g.lsp_on_demands)
end
