return {
    'neovim/nvim-lspconfig',

    event = { 'BufReadPre', 'BufNewFile' },

    lazy = false,

    dependencies = {
        'mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },

    config = function()
        local nvim_lsp = require('lspconfig')
        local mason_lspconfig = require('mason-lspconfig')

        local capabilities = require('cmp').default_capabilities

        mason_lspconfig.setup_handlers({
            function (server_name)
                nvim_lsp[server_name].setup({
                    capabilities = capabilities,
                })
            end,
        })
    end
}
