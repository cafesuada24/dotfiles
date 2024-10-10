return {
    'williamboman/mason-lspconfig.nvim',

    lazy = false,

    dependencies = {
        'mason.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },
    
    config = function()
        local mason_lspconfig = require('mason-lspconfig')
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        mason_lspconfig.setup({
            ensure_installed = {
                'clangd',
                'pyright'
            },

            automatic_installation = false,

            handlers = {
                function (server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities, 
                    })
                end
            }
        })
    end

}
