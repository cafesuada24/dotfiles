return {
  'hrsh7th/nvim-cmp',

  event = { 'InsertEnter', 'CmdlineEnter' },

  dependencies = {
    'nvim-lspconfig',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },

  config = function()
    local cmp = require('cmp')

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      mapping = require('config.keymaps').nvim_cmp(cmp),

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
      }, {
        { name = 'buffer' }
      }),

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    -- cmp.setup.cmdline({ '/', '?' }, {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = {
    --     { name = 'buffer' }
    --   }
    -- })
    --
    -- cmp.setup.cmdline(':', {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources({
    --     { name = 'path' }
    --   }, {
    --     { name = 'cmdline' }
    --   }),
    --   matching = { disallow_symbol_nonprefix_matching = false }
    -- })
  end
}
