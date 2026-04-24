return {
  'mason-org/mason-lspconfig.nvim',

  lazy = false,

  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
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
    automatic_enable = true,
  },

  config = function(_, opts)
    require('mason-lspconfig').setup(opts)

    vim.lsp.config('*', {
      debounce_text_changes = 300, -- milliseconds
    })
    --
    --   vim.lsp.enable({
    --     'pyright',
    --     'lua_ls',
    --     'clangd',
    --     'ts_ls',
    --     'lemminx',
    --     'terraformls',
    --     'tflint',
    --     'ruff',
    --   })
    --
    vim.diagnostic.config({
      -- virtual_lines = true,
      virtual_text = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = 'rounded',
        source = true,
      },
      signs = {
        --   text = {
        -- },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
          [vim.diagnostic.severity.WARN] = 'WarningMsg',
        }
      }
    })
  end
}
