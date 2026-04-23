
vim.lsp.enable({
  'pyright',
  'lua_ls',
  'clangd',
  'ts_ls',
  'lemminx',
  'terraformls',
  'tflint',
})

vim.lsp.config("*", {
  debounce_text_changes = 300, -- milliseconds
})

vim.diagnostic.config({
  virtual_line = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})
