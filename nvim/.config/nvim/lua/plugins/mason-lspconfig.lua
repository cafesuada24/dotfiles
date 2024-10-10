return {
    'williamboman/mason-lspconfig.nvim',

    lazy = false,

    dependencies = {
        'mason.nvim'
    },
    
    opts = {
        ensure_installed = {
            'clangd',
            'pyright'
        },

        automatic_installation = false,

        handlers = {
            function (server_name)
                require('lspconfig')[server_name].setup({})
            end
        }
    }

}
