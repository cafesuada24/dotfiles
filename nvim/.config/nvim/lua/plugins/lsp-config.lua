return {
  'neovim/nvim-lspconfig',

  event = { 'BufReadPre', 'BufNewFile' },

  lazy = false,

  dependencies = {
    'williamboman/mason.nvim',
    'mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },

  opts = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp, cmp = pcall(require, 'cmp_nvim_lsp')
    if has_cmp then
      capabilities = cmp.default_capabilities(capabilities)
    end


    return {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = 'if_many',
          prefix = '●',
        },
        severity_sort = true,
      },
      inlay_hints = {
        enabled = true,
        exclude = { 'vue' },
      },
      codelens = {
        enabled = false,
      },
      document_highlight = {
        enabled = true,
      },
      capabilities = capabilities,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = {
        lua_ls = {
          filetypes = { 'lua' },
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = 'Replace',
              },
              hint = {
                enable = true,
              },
              format = {
                enable = true,
                defaultConfig = {
                  indent_style = 'space',
                  indent_size = '2',
                  quote_style = 'single',
                }
              },
            },
          },
        },
        pyright = {
          settings = {
            pyright = {
              -- Using Ruff's import organizer
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' },
              },
            },
          }
        },
      },
      setup = {},
    }
  end,

  config = function(_, opts)
    vim.diagnostic.config(opts.diagnostics)
    local lspconfig = require('lspconfig')
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        local server_opts = opts.servers[server_name] or {}
        server_opts.capabilities = opts.capabilities
        lspconfig[server_name].setup(server_opts)
      end
    })
  end
}
