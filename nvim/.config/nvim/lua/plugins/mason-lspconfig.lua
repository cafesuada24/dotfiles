return {
    'williamboman/mason-lspconfig.nvim',

    dependencies = {
        'williamboman/mason.nvim',
    },

    opts = {
        ensure_installed = {
            'clangd',
            'pyright'
        },

        automatic_installation = false,
    },
}
