return {
  'mason-org/mason-lspconfig.nvim',
   lazy = false,

  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
  },

  opts = {
    ensure_installed = {
      'clangd',
      'pyright',
      'ruff',
      'bashls',
      'ts_ls',
      'lua_ls',
      'terraformls',
      'tflint',
    },

    automatic_installation = false,
  },
}
