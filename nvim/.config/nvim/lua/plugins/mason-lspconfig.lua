return {
    'williamboman/mason-lspconfig.nvim',

    dependencies = {
        'mason.nvim',
    },

    opts = {
        ensure_installed = {
            'clangd',
            'pyright'
        },

        automatic_installation = false,
    },
}
